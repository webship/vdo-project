<?php

namespace Drupal\varbase_gleap\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Configure Varbase Gleap settings for this site.
 */
class VarbaseGleapSettingsForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'varbase_gleap_varbase_gleap_settings';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return ['varbase_gleap.settings'];
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form['varbase_gleap_api_key'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Varbase Gleap API Key'),
      '#default_value' => $this->config('varbase_gleap.settings')->get('varbase_gleap_api_key'),
    ];
    return parent::buildForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    parent::validateForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $this->config('varbase_gleap.settings')
      ->set('varbase_gleap_api_key', $form_state->getValue('varbase_gleap_api_key'))
      ->save();
    parent::submitForm($form, $form_state);
  }

}
