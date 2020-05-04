Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C81C405A
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 18:44:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E99C4860F1;
	Mon,  4 May 2020 16:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5vX5Ht457Jx; Mon,  4 May 2020 16:44:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B3BC6868B2;
	Mon,  4 May 2020 16:44:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F2A8C0175;
	Mon,  4 May 2020 16:44:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6B08C0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 95B9B86B1C
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oAeBSlp6nwK for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 16:44:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8C10486B11
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:44:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k1so2904962wro.12
 for <iommu@lists.linux-foundation.org>; Mon, 04 May 2020 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nKcmHJjl9tIFKl3vh2WZWbQ1a6qf0OFNOmjvKAG+T5w=;
 b=GVujRTu9LfTtfSzWvR/blDgA6L4wRuxbhYL/JkbyHQuSK8LBG1AbIRX7hrdeiN0O7Z
 8Baza83dK07XMfbk20Q4GjHiYd4X4taXQr82nh40jV8dNTlKcvoKIZtYRHESbkJA0Mei
 m0JLe0wL6lKWe3B00KhI1No1bnfAYcK4FWXAj0PDFUuXEgS3N/NCSXdao12JT6mYvX7R
 wWA8cKGRE8zdnC3olLE8Amc6l6swWxcCLhl/UAEav9UYx2rkCZQF3jq3haIKHqp/B/Tc
 bv20hTPber8xWSwz5soOC6sjFXModYLMxNromwl4JxU9GswTWo613kfBFwjSkE/8acrI
 lxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nKcmHJjl9tIFKl3vh2WZWbQ1a6qf0OFNOmjvKAG+T5w=;
 b=aLiVr1TFyUOb6CW4KD+cDYawbvPc6eJEAd5Q5IBFEJ0qRxU1voyXRMufnnk7W4LMZQ
 6Y0IJNF1ILiAuqDnQYbqPVozCkE7IDCbXJBn+E//DR6dUu6BuwSgXHL7tchGv+IP1uhg
 qHcK81BmzHX383imkQVFfQ2oX73GfIXh2oiqyCuY62gOCk67JzXk/Dxr4xhbbBty6dJC
 j/5krntPD737Dr4IIzgEsJp4wScG2etb98gYAzQ065L6U7Re5pgj5DoI+aV+F7NZoBYs
 qKz8/5vDsQIrshWCksKGYViJ7RQ2DddCPS37V9OumpMvTCgdVFp01pk7gjKNn2jt3n4n
 yLrg==
X-Gm-Message-State: AGi0PubzcMmE0n+EY2G7lccvtMNDZJhyWjJ8l7vF8PEyH19wnt0PXIcW
 99+I7T2vz7SWGlsMk6SAdUlImg==
X-Google-Smtp-Source: APiQypIoWxNfvYjKhhuxv6cQDK75SO+JQ8441jozvjondQeZtyDNRGUJBpfXr2gHhMn+rcM5zZPzpw==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr12708701wrt.215.1588610642110; 
 Mon, 04 May 2020 09:44:02 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id n12sm7101170wrj.95.2020.05.04.09.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 09:44:01 -0700 (PDT)
Date: Mon, 4 May 2020 18:43:51 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v6 17/25] iommu/arm-smmu-v3: Implement
 iommu_sva_bind/unbind()
Message-ID: <20200504164351.GJ170104@myrica>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-18-jean-philippe@linaro.org>
 <20200430141617.6ad4be4c@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430141617.6ad4be4c@jacob-builder>
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Apr 30, 2020 at 02:16:17PM -0700, Jacob Pan wrote:
> > +static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
> > +					 struct mm_struct *mm,
> > +					 unsigned long start,
> > unsigned long end) +{
> > +	/* TODO: invalidate ATS */
> > +}
> > +
> > +static void arm_smmu_mm_release(struct mmu_notifier *mn, struct
> > mm_struct *mm) +{
> > +	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
> > +	struct arm_smmu_domain *smmu_domain;
> > +
> > +	mutex_lock(&arm_smmu_sva_lock);
> > +	if (smmu_mn->cleared) {
> > +		mutex_unlock(&arm_smmu_sva_lock);
> > +		return;
> > +	}
> > +
> > +	smmu_domain = smmu_mn->domain;
> > +
> > +	/*
> > +	 * DMA may still be running. Keep the cd valid but disable
> > +	 * translation, so that new events will still result in
> > stall.
> > +	 */
> Does "disable translation" also disable translated requests?

No it doesn't disable translated requests, it only prevents the SMMU from
accessing the pgd.

> I guess
> release is called after tlb invalidate range, so assuming no more
> devTLB left to generate translated request?

I'm counting on the invalidate below (here a TODO, implemented in next
patch) to drop all devTLB entries. After that invalidate, the device:
* issues a Translation Request, returns with R=W=0 because we disabled
  translation (and it isn't present in the SMMU TLB).
* issues a Page Request, returns with InvalidRequest because
  mmget_not_zero() fails.

> 
> > +	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, &invalid_cd);
> > +
> > +	arm_smmu_tlb_inv_asid(smmu_domain->smmu, smmu_mn->cd->asid);
> > +	/* TODO: invalidate ATS */
> > +
> If mm release is called after tlb invalidate range, is it still
> necessary to invalidate again?

No, provided all mappings from the address space are unmapped and
invalidated. I'll double check, but in my tests invalidate range didn't
seem to be called for all mappings on mm exit, so I believe we do need
this.

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
