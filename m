Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B35E7EAD
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 03:57:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 908EFEDA;
	Tue, 29 Oct 2019 02:57:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4713B949
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 02:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6EBA48A
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 02:57:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 19:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; d="scan'208";a="224831695"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2019 19:57:26 -0700
Subject: Re: [PATCH v7 09/11] iommu/vt-d: Add bind guest PASID support
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<a9a1c3ed-0134-f531-fbf1-789f6cc78ce3@linux.intel.com>
	<20191028152945.13bc22fa@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e4ac7f82-a224-3388-88ae-1ce52d2eec58@linux.intel.com>
Date: Tue, 29 Oct 2019 10:54:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028152945.13bc22fa@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 10/29/19 6:29 AM, Jacob Pan wrote:
> Hi Baolu,
> 
> Appreciate the thorough review, comments inline.

You are welcome.

> 
> On Sat, 26 Oct 2019 10:01:19 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> Hi,
>>

[...]

>>> +			 * allow multiple bind calls with the same
>>> PASID and pdev.
>>> +			 */
>>> +			sdev->users++;
>>> +			goto out;
>>> +		}
>>
>> I remember I ever pointed this out before. But I forgot how we
>> addressed it. So forgive me if this has been addressed.
>>
>> What if we have a valid bound svm but @dev doesn't belong to it
>> (a.k.a. @dev not in svm->devs list)?
>>
> If we are binding a new device to an existing/active PASID, the code
> will allocate a new sdev and add that to the svm->devs list.

But allocating a new sdev and adding device is in below else branch, so
it will never reach there, right?

>>> +	} else {
>>> +		/* We come here when PASID has never been bond to
>>> a device. */
>>> +		svm = kzalloc(sizeof(*svm), GFP_KERNEL);
>>> +		if (!svm) {
>>> +			ret = -ENOMEM;
>>> +			goto out;
>>> +		}
>>> +		/* REVISIT: upper layer/VFIO can track host
>>> process that bind the PASID.
>>> +		 * ioasid_set = mm might be sufficient for vfio to
>>> check pasid VMM
>>> +		 * ownership.
>>> +		 */
>>> +		svm->mm = get_task_mm(current);
>>> +		svm->pasid = data->hpasid;
>>> +		if (data->flags & IOMMU_SVA_GPASID_VAL) {
>>> +			svm->gpasid = data->gpasid;
>>> +			svm->flags |= SVM_FLAG_GUEST_PASID;
>>> +		}
>>> +		ioasid_set_data(data->hpasid, svm);
>>> +		INIT_LIST_HEAD_RCU(&svm->devs);
>>> +		INIT_LIST_HEAD(&svm->list);
>>> +
>>> +		mmput(svm->mm);
>>> +	}
>>
>> A blank line, please.
> looks good.
>>
>>> +	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
>>> +	if (!sdev) {
>>> +		if (list_empty(&svm->devs))
>>> +			kfree(svm);
>>
>> This is dangerous. This might leave a wild pointer bound with gpasid.
>>
> why is that? can you please explain?
> if the list is empty that means we just allocated the new svm, no
> users. why can't we free it here?

svm has been associated with the pasid private data. It needs to be
unbound from pasid before getting freed. Otherwise, a wild pointer will
be left.

	ioasid_set_data(pasid, NULL);
	kfree(svm);

> 
>>> +		ret = -ENOMEM;
>>> +		goto out;
>>> +	}
>>> +	sdev->dev = dev;
>>> +	sdev->users = 1;
>>> +
>>> +	/* Set up device context entry for PASID if not enabled
>>> already */
>>> +	ret = intel_iommu_enable_pasid(iommu, sdev->dev);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to enable PASID
>>> capability\n");
>>> +		kfree(sdev);
>>> +		goto out;
>>> +	}
>>> +
>>> +	/*
>>> +	 * For guest bind, we need to set up PASID table entry as
>>> follows:
>>> +	 * - FLPM matches guest paging mode
>>> +	 * - turn on nested mode
>>> +	 * - SL guest address width matching
>>> +	 */
>>> +	ret = intel_pasid_setup_nested(iommu,
>>> +				dev,
>>> +				(pgd_t *)data->gpgd,
>>> +				data->hpasid,
>>> +				&data->vtd,
>>> +				ddomain,
>>> +				data->addr_width);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to set up PASID %llu in
>>> nested mode, Err %d\n",
>>> +			data->hpasid, ret);
>>
>> This error handling is insufficient. You should at least:
>>
>> 1. free sdev
> already done below
> 
>> 2. if list_empty(&svm->devs)
>> 	unbound the svm from gpasid
>> 	free svm
>>
> yes, agreed.
> 
>> The same for above error handling. Add a branch for error recovery at
>> the end of function might help here.
>>
> not sure which code is the same as above? could you point it out?

Above last comment. :-)

>>> +		kfree(sdev);
>>> +		goto out;
>>> +	}
>>> +	svm->flags |= SVM_FLAG_GUEST_MODE;
>>> +
>>> +	init_rcu_head(&sdev->rcu);
>>> +	list_add_rcu(&sdev->list, &svm->devs);
>>> + out:
>>> +	mutex_unlock(&pasid_mutex);
>>> +	return ret;
>>> +}
>>> +
>>> +int intel_svm_unbind_gpasid(struct device *dev, int pasid)
>>> +{
>>> +	struct intel_svm_dev *sdev;
>>> +	struct intel_iommu *iommu;
>>> +	struct intel_svm *svm;
>>> +	int ret = -EINVAL;
>>> +
>>> +	mutex_lock(&pasid_mutex);
>>> +	iommu = intel_svm_device_to_iommu(dev);
>>> +	if (!iommu)
>>> +		goto out;
>>
>> Make it symmetrical with bind function.
>>
>> 	if (WARN_ON(!iommu))
>> 		goto out;
>>
> sounds good.
>>> +
>>> +	svm = ioasid_find(NULL, pasid, NULL);
>>> +	if (IS_ERR_OR_NULL(svm)) {
>>> +		ret = PTR_ERR(svm);
>>
>> If svm == NULL, this function will return success. This is not
>> expected, right?
>>
> good catch, will fix.
>>> +		goto out;
>>> +	}
>>> +
>>> +	for_each_svm_dev(svm, dev) {
>>> +		ret = 0;
>>> +		sdev->users--;
>>> +		if (!sdev->users) {
>>> +			list_del_rcu(&sdev->list);
>>> +			intel_pasid_tear_down_entry(iommu, dev,
>>> svm->pasid);
>>> +			/* TODO: Drain in flight PRQ for the PASID
>>> since it
>>> +			 * may get reused soon, we don't want to
>>> +			 * confuse with its previous life.
>>> +			 * intel_svm_drain_prq(dev, pasid);
>>> +			 */
>>> +			kfree_rcu(sdev, rcu);
>>> +
>>> +			if (list_empty(&svm->devs)) {
>>> +				list_del(&svm->list);
>>> +				kfree(svm);
>>> +				/*
>>> +				 * We do not free PASID here until
>>> explicit call
>>> +				 * from VFIO to free. The PASID
>>> life cycle
>>> +				 * management is largely tied to
>>> VFIO management
>>> +				 * of assigned device life cycles.
>>> In case of
>>> +				 * guest exit without a explicit
>>> free PASID call,
>>> +				 * the responsibility lies in VFIO
>>> layer to free
>>> +				 * the PASIDs allocated for the
>>> guest.
>>> +				 * For security reasons, VFIO has
>>> to track the
>>> +				 * PASID ownership per guest
>>> anyway to ensure
>>> +				 * that PASID allocated by one
>>> guest cannot be
>>> +				 * used by another.
>>> +				 */
>>> +				ioasid_set_data(pasid, NULL);
>>
>> Exchange order. First unbind svm from gpasid and then free svm.
>>
> I am not following, aren't we already doing free svm after unbind?
> please explain.

I meant

	ioasid_set_data(pasid, NULL);
	kfree(svm);

in reverse order, it leaves a short window when svm is freed, but pasid
private data is still kept svm (wild pointer).


>>> +			}
>>> +		}
>>> +		break;
>>> +	}
>>> + out:
>>> +	mutex_unlock(&pasid_mutex);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    int intel_svm_bind_mm(struct device *dev, int *pasid, int flags,
>>> struct svm_dev_ops *ops) {
>>>    	struct intel_iommu *iommu =
>>> intel_svm_device_to_iommu(dev); diff --git
>>> a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h index
>>> 3dba6ad3e9ad..6c74c71b1ebf 100644 --- a/include/linux/intel-iommu.h
>>> +++ b/include/linux/intel-iommu.h
>>> @@ -673,7 +673,9 @@ int intel_iommu_enable_pasid(struct intel_iommu
>>> *iommu, struct device *dev); int intel_svm_init(struct intel_iommu
>>> *iommu); extern int intel_svm_enable_prq(struct intel_iommu *iommu);
>>>    extern int intel_svm_finish_prq(struct intel_iommu *iommu);
>>> -
>>> +extern int intel_svm_bind_gpasid(struct iommu_domain *domain,
>>> +		struct device *dev, struct iommu_gpasid_bind_data
>>> *data); +extern int intel_svm_unbind_gpasid(struct device *dev, int
>>> pasid); struct svm_dev_ops;
>>>    
>>>    struct intel_svm_dev {
>>> @@ -690,9 +692,13 @@ struct intel_svm_dev {
>>>    struct intel_svm {
>>>    	struct mmu_notifier notifier;
>>>    	struct mm_struct *mm;
>>> +
>>>    	struct intel_iommu *iommu;
>>>    	int flags;
>>>    	int pasid;
>>> +	int gpasid; /* Guest PASID in case of vSVA bind with
>>> non-identity host
>>> +		     * to guest PASID mapping.
>>> +		     */
>>>    	struct list_head devs;
>>>    	struct list_head list;
>>>    };
>>> diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
>>> index 94f047a8a845..a2c189ad0b01 100644
>>> --- a/include/linux/intel-svm.h
>>> +++ b/include/linux/intel-svm.h
>>> @@ -44,6 +44,23 @@ struct svm_dev_ops {
>>>     * do such IOTLB flushes automatically.
>>>     */
>>>    #define SVM_FLAG_SUPERVISOR_MODE	(1<<1)
>>> +/*
>>> + * The SVM_FLAG_GUEST_MODE flag is used when a guest process bind
>>> to a device.
>>> + * In this case the mm_struct is in the guest kernel or userspace,
>>> its life
>>> + * cycle is managed by VMM and VFIO layer. For IOMMU driver, this
>>> API provides
>>> + * means to bind/unbind guest CR3 with PASIDs allocated for a
>>> device.
>>> + */
>>> +#define SVM_FLAG_GUEST_MODE	(1<<2)
>>
>> How about keeping this aligned with top by adding a tab?
>>
> sounds good.
>> BIT macro is preferred. Hence, make it BIT(1), BIT(2), BIT(3) is
>> preferred.
>>
> I know, but the existing mainline code is not using BIT, so I wanted
> to keep coding style consistent. Perhaps a separate cleanup patch will
> do later.

It makes sense to me.

>>> +/*
>>> + * The SVM_FLAG_GUEST_PASID flag is used when a guest has its own
>>> PASID space,
>>> + * which requires guest and host PASID translation at both
>>> directions. We keep
>>> + * track of guest PASID in order to provide lookup service to
>>> device drivers.
>>> + * One such example is a physical function (PF) driver that
>>> supports mediated
>>> + * device (mdev) assignment. Guest programming of mdev
>>> configuration space can
>>> + * only be done with guest PASID, therefore PF driver needs to
>>> find the matching
>>> + * host PASID to program the real hardware.
>>> + */
>>> +#define SVM_FLAG_GUEST_PASID	(1<<3)
>>
>> Ditto.
>>
>> Best regards,
>> baolu
> 
> [Jacob Pan]
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
