Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01421AE83
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 07:25:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 752D9204E9;
	Fri, 10 Jul 2020 05:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaEtR-FVab+G; Fri, 10 Jul 2020 05:25:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E0308204B3;
	Fri, 10 Jul 2020 05:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAE29C016F;
	Fri, 10 Jul 2020 05:25:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E2F0C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 05:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 896F88984C
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 05:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Sn-uvLcicdW for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 05:25:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A76D8983C
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 05:25:38 +0000 (UTC)
IronPort-SDR: 2W8/UoDkxrydhGylFeoz2cJfnPZtTJTNAnJdHddXk065dnYFoN9RY817ennQqrlBwBloWpWpcC
 /OMEAvJ2BU6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="128219723"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="128219723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 22:25:37 -0700
IronPort-SDR: 4j1ShUqut6A/r8IhoUGs/RIzlFrgal+5jxzG2jIA7llcRJ+31FQnBAAPVZpv43cmICMrFm2BGN
 t9X91ktzGD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="298313649"
Received: from xzhou33-mobl1.ccr.corp.intel.com (HELO [10.255.31.159])
 ([10.255.31.159])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2020 22:25:35 -0700
Subject: Re: [PATCH v3 3/4] iommu/vt-d: Report page request faults for guest
 SVA
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20200709070537.18473-1-baolu.lu@linux.intel.com>
 <20200709070537.18473-4-baolu.lu@linux.intel.com>
 <MWHPR11MB1645D22D2CBCECE1257CBFEF8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <027ccdd4-003e-9cf7-c519-d5655606b702@linux.intel.com>
Date: Fri, 10 Jul 2020 13:25:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1645D22D2CBCECE1257CBFEF8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Kevin,

On 2020/7/10 10:24, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Thursday, July 9, 2020 3:06 PM
>>
>> A pasid might be bound to a page table from a VM guest via the iommu
>> ops.sva_bind_gpasid. In this case, when a DMA page fault is detected
>> on the physical IOMMU, we need to inject the page fault request into
>> the guest. After the guest completes handling the page fault, a page
>> response need to be sent back via the iommu ops.page_response().
>>
>> This adds support to report a page request fault. Any external module
>> which is interested in handling this fault should regiester a notifier
>> with iommu_register_device_fault_handler().
>>
>> Co-developed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Co-developed-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/svm.c | 103 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 85 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
>> index c23167877b2b..d24e71bac8db 100644
>> --- a/drivers/iommu/intel/svm.c
>> +++ b/drivers/iommu/intel/svm.c
>> @@ -815,8 +815,63 @@ static void intel_svm_drain_prq(struct device *dev,
>> int pasid)
>>   	}
>>   }
>>
>> +static int prq_to_iommu_prot(struct page_req_dsc *req)
>> +{
>> +	int prot = 0;
>> +
>> +	if (req->rd_req)
>> +		prot |= IOMMU_FAULT_PERM_READ;
>> +	if (req->wr_req)
>> +		prot |= IOMMU_FAULT_PERM_WRITE;
>> +	if (req->exe_req)
>> +		prot |= IOMMU_FAULT_PERM_EXEC;
>> +	if (req->pm_req)
>> +		prot |= IOMMU_FAULT_PERM_PRIV;
>> +
>> +	return prot;
>> +}
>> +
>> +static int
>> +intel_svm_prq_report(struct device *dev, struct page_req_dsc *desc)
>> +{
>> +	struct iommu_fault_event event;
>> +
>> +	/* Fill in event data for device specific processing */
>> +	memset(&event, 0, sizeof(struct iommu_fault_event));
>> +	event.fault.type = IOMMU_FAULT_PAGE_REQ;
>> +	event.fault.prm.addr = desc->addr;
>> +	event.fault.prm.pasid = desc->pasid;
>> +	event.fault.prm.grpid = desc->prg_index;
>> +	event.fault.prm.perm = prq_to_iommu_prot(desc);
>> +
>> +	if (!dev || !dev_is_pci(dev))
>> +		return -ENODEV;
> 
> move the check before memset.

Yes.

> 
>> +
>> +	if (desc->lpig)
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
>> +	if (desc->pasid_present) {
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID;
>> +	}
> 
> if pasid is not present, should we return error directly instead of
> submitting the req and let iommu core to figure out? I don't have

This has been done in prq_event_thread(), so I don't need to check it
again here.

> a strong preference, thus:
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks a lot for your time.

Best regards,
baolu

> 
>> +	if (desc->priv_data_present) {
>> +		/*
>> +		 * Set last page in group bit if private data is present,
>> +		 * page response is required as it does for LPIG.
>> +		 * iommu_report_device_fault() doesn't understand this
>> vendor
>> +		 * specific requirement thus we set last_page as a
>> workaround.
>> +		 */
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA;
>> +		memcpy(event.fault.prm.private_data, desc->priv_data,
>> +		       sizeof(desc->priv_data));
>> +	}
>> +
>> +	return iommu_report_device_fault(dev, &event);
>> +}
>> +
>>   static irqreturn_t prq_event_thread(int irq, void *d)
>>   {
>> +	struct intel_svm_dev *sdev = NULL;
>>   	struct intel_iommu *iommu = d;
>>   	struct intel_svm *svm = NULL;
>>   	int head, tail, handled = 0;
>> @@ -828,7 +883,6 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   	tail = dmar_readq(iommu->reg + DMAR_PQT_REG) &
>> PRQ_RING_MASK;
>>   	head = dmar_readq(iommu->reg + DMAR_PQH_REG) &
>> PRQ_RING_MASK;
>>   	while (head != tail) {
>> -		struct intel_svm_dev *sdev;
>>   		struct vm_area_struct *vma;
>>   		struct page_req_dsc *req;
>>   		struct qi_desc resp;
>> @@ -864,6 +918,20 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   			}
>>   		}
>>
>> +		if (!sdev || sdev->sid != req->rid) {
>> +			struct intel_svm_dev *t;
>> +
>> +			sdev = NULL;
>> +			rcu_read_lock();
>> +			list_for_each_entry_rcu(t, &svm->devs, list) {
>> +				if (t->sid == req->rid) {
>> +					sdev = t;
>> +					break;
>> +				}
>> +			}
>> +			rcu_read_unlock();
>> +		}
>> +
>>   		result = QI_RESP_INVALID;
>>   		/* Since we're using init_mm.pgd directly, we should never
>> take
>>   		 * any faults on kernel addresses. */
>> @@ -874,6 +942,17 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   		if (!is_canonical_address(address))
>>   			goto bad_req;
>>
>> +		/*
>> +		 * If prq is to be handled outside iommu driver via receiver of
>> +		 * the fault notifiers, we skip the page response here.
>> +		 */
>> +		if (svm->flags & SVM_FLAG_GUEST_MODE) {
>> +			if (sdev && !intel_svm_prq_report(sdev->dev, req))
>> +				goto prq_advance;
>> +			else
>> +				goto bad_req;
>> +		}
>> +
>>   		/* If the mm is already defunct, don't handle faults. */
>>   		if (!mmget_not_zero(svm->mm))
>>   			goto bad_req;
>> @@ -892,24 +971,11 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   			goto invalid;
>>
>>   		result = QI_RESP_SUCCESS;
>> -	invalid:
>> +invalid:
>>   		mmap_read_unlock(svm->mm);
>>   		mmput(svm->mm);
>> -	bad_req:
>> -		/* Accounting for major/minor faults? */
>> -		rcu_read_lock();
>> -		list_for_each_entry_rcu(sdev, &svm->devs, list) {
>> -			if (sdev->sid == req->rid)
>> -				break;
>> -		}
>> -		/* Other devices can go away, but the drivers are not
>> permitted
>> -		 * to unbind while any page faults might be in flight. So it's
>> -		 * OK to drop the 'lock' here now we have it. */
>> -		rcu_read_unlock();
>> -
>> -		if (WARN_ON(&sdev->list == &svm->devs))
>> -			sdev = NULL;
>> -
>> +bad_req:
>> +		WARN_ON(!sdev);
>>   		if (sdev && sdev->ops && sdev->ops->fault_cb) {
>>   			int rwxp = (req->rd_req << 3) | (req->wr_req << 2) |
>>   				(req->exe_req << 1) | (req->pm_req);
>> @@ -920,7 +986,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   		   and these can be NULL. Do not use them below this point!
>> */
>>   		sdev = NULL;
>>   		svm = NULL;
>> -	no_pasid:
>> +no_pasid:
>>   		if (req->lpig || req->priv_data_present) {
>>   			/*
>>   			 * Per VT-d spec. v3.0 ch7.7, system software must
>> @@ -945,6 +1011,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   			resp.qw3 = 0;
>>   			qi_submit_sync(iommu, &resp, 1, 0);
>>   		}
>> +prq_advance:
>>   		head = (head + sizeof(*req)) & PRQ_RING_MASK;
>>   	}
>>
>> --
>> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
