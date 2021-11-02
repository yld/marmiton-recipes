import React from "react";
import PropTypes from "prop-types";
class RecipeItem extends React.Component {
  render() {
    const renderImage = () => {
      if (this.props.image !== null) {
        return <img src={this.props.image} />;
      } else {
        return "";
      }
    };

    return (
      <div>
        <h1>{this.props.name}</h1>
        {renderImage}
        <dl>
          <dt>Ingredients</dt>
          <dt>{this.props.ingredients.join(", ")}</dt>
          <dt>Temps de cuisson</dt>
          <dt>{this.props.cook_time}</dt>
          <dt>Temps de préparation</dt>
          <dt>{this.props.prep_time}</dt>
          <dt>Temps total</dt>
          <dt>{this.props.total_time}</dt>
          <dt>Auteur</dt>
          <dt>{this.props.author}</dt>
          <dt>Nombre de commentaires</dt>
          <dt>{this.props.nb_comments}</dt>
          <dt>Nombre de personnes</dt>
          <dt>{this.props.people_quantity}</dt>
          <dt>Budget</dt>
          <dt>{this.props.budget}</dt>
          <dt>Difficulté</dt>
          <dt>{this.props.difficulty}</dt>
          <dt>Note</dt>
          <dt>{this.props.rate}</dt>
          <dt>Astuce de l'auteur</dt>
          <dt>{this.props.author_tip}</dt>
          <dt>Tags</dt>
          <dt>{this.props.tags}</dt>
        </dl>
      </div>
    );
  }
}

export default RecipeItem;
