require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

    describe '一覧表示機能' do
        context '一覧画面に遷移した場合' do
            it '登録済みのタスク一覧が表示される' do
                # テストで使用するためのタスクを登録
                FactoryBot.create(:task)
                # タスク一覧画面に遷移
                visit tasks_path
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
                expect(page).to have_content '書類作成'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
            end
        end
    end

    describe '登録機能' do
        context 'タスクを登録した場合' do
            it '登録したタスクが表示される' do
                # テストで使用するためのタスクを登録
                FactoryBot.create(:task,title: 'bien')
                # タスク一覧画面に遷移
                visit root_path
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
                expect(page).to have_content 'bien'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
            end
        end
    end

    describe '詳細表示機能' do
        context '任意のタスク詳細画面に遷移した場合' do
            it 'そのタスクの内容が表示される' do
                # テストで使用するためのタスクを登録
                @task = FactoryBot.create(:task, content: 'content')
                # タスク一覧画面に遷移
                visit task_path(@task.id)
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
                expect(page).to have_content 'content'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
            end
        end
    end

    describe 'list display' do
        context 'fonction when transitioning to' do
            it 'the list screen a list of registered tasks is displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit new_task_path
                expect(page).not_to have_content 'New Task Page'
            end
        end
    end

    describe 'registration function' do
        context 'when you register a task' do
            it 'the registered tasks is displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit tasks_path
                expect(page).to have_content @task.title
            end
        end
    end

    describe 'detailed display' do
        context 'fonction when transitioning to any task details screen' do
            it 'the contents of the task are displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit task_path(@task.id)
                expect(page).to have_content @task.content
            end
        end
    end

    
end
