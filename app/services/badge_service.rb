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
    return unless badge.subject_name == @test.category.title

    test_category = @test.category
    passed = @user.test_passages.find_all { |test_passage| test_passage.successful? }.map { |tp| tp.test }.uniq
    passed.find_all { |test| test.category == test_category }.count == test_category.tests.count
  end
end

