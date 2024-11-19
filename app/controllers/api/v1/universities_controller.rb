# frozen_string_literal: true

class Api::V1::UniversitiesController < ApplicationController
  before_action :find_university, only: [ :show, :update, :destroy ]

  def index
    universities = University.all

    render json: universities, status: :ok
  end

  def show
    render json: @university, status: :ok
  end

  def create
    university = University.new(university_params)

    if university.save
      render json: university, status: :created, location: api_v1_university_path(university)
    else
      render json: university.errors, status: :unprocessable_entity
    end
  end

  def update
    if @university.update(university_params)
      render json: @university, status: :ok
    else
      render json: @university.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @university.destroy
    head :no_content
  end

  private

  def university_params
    params.require(:university).permit(:name, :location, :website, contact_emails: [])
  end

  def find_university
    @university = University.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "University not found" }, status: :not_found
  end
end
