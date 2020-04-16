Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9C1ABE5E
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 12:46:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C543E221B5;
	Thu, 16 Apr 2020 10:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvglDywj2iWz; Thu, 16 Apr 2020 10:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5FA87221B2;
	Thu, 16 Apr 2020 10:46:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5135CC0172;
	Thu, 16 Apr 2020 10:46:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B56FC0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 198BD221B2
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1or3chQrMkp for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 10:46:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 59019220C1
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587033980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=663Ng6YS73plx9PBQ6c4/yXjrAwiTI7oew+JgnDni+g=;
 b=A80Zi6lMS/qss0v3179yGEJw3NZ8FEnC8aIXSh108MJIfff3v0ffwn4pZyJN8BMYwrUMam
 3mffwDyNsqWXhY2+KfYSpLe2rGGhHFqW8FvEEzpXSdmamkd9wkJ1zh9BqoIUwMVFWqCD0q
 Wd/vKoJvZHMdx8EFtzTCebY2PyTJhy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-8WfVj1OmOPmB33JsuWl5mw-1; Thu, 16 Apr 2020 06:46:16 -0400
X-MC-Unique: 8WfVj1OmOPmB33JsuWl5mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94445107ACC4;
 Thu, 16 Apr 2020 10:46:14 +0000 (UTC)
Received: from [10.36.115.53] (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C98402719A;
 Thu, 16 Apr 2020 10:46:08 +0000 (UTC)
Subject: Re: [PATCH v11 05/10] iommu/vt-d: Add bind guest PASID support
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <ab57b85b-235f-dc80-1c25-9b3d42dc5f4e@redhat.com>
 <20200410140604.403cb5b2@jacob-builder>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d5c4181f-4542-e8bc-adb6-35eb3d8f5b21@redhat.com>
Date: Thu, 16 Apr 2020 12:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200410140604.403cb5b2@jacob-builder>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jacob,

On 4/10/20 11:06 PM, Jacob Pan wrote:
> Hi Eric,
> 
> Missed a few things in the last reply.
> 
> On Thu, 9 Apr 2020 09:41:32 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>>> +			intel_pasid_tear_down_entry(iommu, dev,
>>> svm->pasid);  
>> intel_svm_unbind_mm() calls intel_flush_svm_range_dev(svm, sdev, 0,
>> -1, 0); Don't we need to flush the (DEV-)IOTLBs as well?
> Right, pasid tear down should always include (DEV-)IOTLB flush, I
> initially thought it is taken care of by intel_pasid_tear_down_entry().
> 
>>> +			/* TODO: Drain in flight PRQ for the PASID
>>> since it
>>> +			 * may get reused soon, we don't want to
>>> +			 * confuse with its previous life.
>>> +			 * intel_svm_drain_prq(dev, pasid);
>>> +			 */
>>> +			kfree_rcu(sdev, rcu);
>>> +
>>> +			if (list_empty(&svm->devs)) {
>>> +				/*
>>> +				 * We do not free the IOASID here
>>> in that
>>> +				 * IOMMU driver did not allocate
>>> it.  
>> s/in/as?
> I meant to say "in that" as "for the reason that"
ok sorry
> 
>>> +				 * Unlike native SVM, IOASID for
>>> guest use was
>>> +				 * allocated prior to the bind
>>> call.> +				 * In any case, if the free
>>> call comes before
>>> +				 * the unbind, IOMMU driver will
>>> get notified
>>> +				 * and perform cleanup.
>>> +				 */
>>> +				ioasid_set_data(pasid, NULL);
>>> +				kfree(svm);
>>> +			}  
>> nit: you may use intel_svm_free_if_empty()
> True, but I meant to insert ioasid_notifier under the list_empty
> condition in the following ioasid patch.
ok

Thanks

Eric
> 
> 
> Thanks,
> 
> Jacob
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
