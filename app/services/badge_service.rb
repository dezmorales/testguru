class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule, badge)
    end
  end

  private

  def on_first_try(badge)
    @user.test_passages.where(test: @test).count == 1 &&
      @test_passage.successful? &&
      @test.title == badge.subject_name
  end

  def all_by_category(badge)
    category = @test.category
    return if badge.subject_name != @test.category.title

    successful_tests = Test.joins(:test_passages).where(category: category,
                                                        test_passages: { completed: true, user: @user }).distinct
    @test.category.tests.count == successful_tests.count
  end

  def all_by_level(badge)
    level = @test.level
    return if badge.subject_name.to_i != level

    successful_tests = Test.joins(:test_passages).where(level: level,
                                                        test_passages: { completed: true, user: @user }).distinct

    Test.where(level: level).count == successful_tests.count
  end
end


