Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86137124E8A
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 17:59:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36F5F88488;
	Wed, 18 Dec 2019 16:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJTWQtgWppAZ; Wed, 18 Dec 2019 16:59:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 820B3883D7;
	Wed, 18 Dec 2019 16:59:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4DEC077D;
	Wed, 18 Dec 2019 16:59:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2F51C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DCE82883D7
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9U6qQ+02pIBf for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 16:59:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C7DE8837C
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576688381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Za81kYce2Fs+Hb3XKFLJLsPu+11LvEPxuKMd/7XIn8=;
 b=AiYbgD+5NB4VmxHdqO1teLpK0+feyS2jKU8OgEqTmBBnmwXGL7i9DGNk/dXOFDjeAnvk00
 xEjrbSqns4sHqWtlpZVUnM355QO2M/Os7NK5ZMTo7t/MYB5lSnhr5HIC2VTzkk7QKFuo0l
 bGzNi5i+ZzEEbbmqRTymTmJ2FKApaR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-BHfeu4x5N7OvigT_OZNnDg-1; Wed, 18 Dec 2019 11:59:36 -0500
X-MC-Unique: BHfeu4x5N7OvigT_OZNnDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409E219586C2;
 Wed, 18 Dec 2019 16:59:34 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E3F26DEC;
 Wed, 18 Dec 2019 16:59:29 +0000 (UTC)
Subject: Re: [PATCH v3 07/13] iommu/arm-smmu-v3: Add support for Substream IDs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
 <20191209180514.272727-8-jean-philippe@linaro.org>
 <aeed148a-3c55-6e97-8d97-efa4f8c6d9f4@redhat.com>
 <20191218160759.GF2371701@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3f8e85f6-92ac-79a2-f048-780b8712ae99@redhat.com>
Date: Wed, 18 Dec 2019 17:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191218160759.GF2371701@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, robin.murphy@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, guohanjun@huawei.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 lenb@kernel.org
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

Hi Jean,

On 12/18/19 5:07 PM, Jean-Philippe Brucker wrote:
> On Tue, Dec 17, 2019 at 05:43:59PM +0100, Auger Eric wrote:
>>> -static void arm_smmu_write_ctx_desc(struct arm_smmu_device *smmu,
>>> -				    struct arm_smmu_s1_cfg *cfg)
>>> +static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
>>> +				   int ssid, struct arm_smmu_ctx_desc *cd)
>>>  {
>>> -	u64 val;
>>> -	__le64 *cdptr = cfg->table.ptr;
>>> -
>>>  	/*
>>> -	 * We don't need to issue any invalidation here, as we'll invalidate
>>> -	 * the STE when installing the new entry anyway.
>>> +	 * This function handles the following cases:
>>> +	 *
>>> +	 * (1) Install primary CD, for normal DMA traffic (SSID = 0).
>>> +	 * (2) Install a secondary CD, for SID+SSID traffic.
>>> +	 * (3) Update ASID of a CD. Atomically write the first 64 bits of the
>>> +	 *     CD, then invalidate the old entry and mappings.
>>> +	 * (4) Remove a secondary CD.
>> I see arm_smmu_write_ctx_desc getting called with non null cd in
>> arm_smmu_attach_dev but I do not see it removed in the detach path?
> 
> No we don't have to remove the primary CD, since detach clears the STE and
> frees the CD tables.
OK
> 
>>>  	 */
>>> -	val = arm_smmu_cpu_tcr_to_cd(cfg->cd.tcr) |
>>> -#ifdef __BIG_ENDIAN
>>> -	      CTXDESC_CD_0_ENDI |
>>> -#endif
>>> -	      CTXDESC_CD_0_R | CTXDESC_CD_0_A | CTXDESC_CD_0_ASET |
>>> -	      CTXDESC_CD_0_AA64 | FIELD_PREP(CTXDESC_CD_0_ASID, cfg->cd.asid) |
>>> -	      CTXDESC_CD_0_V;
>>> +	u64 val;
>>> +	bool cd_live;
>>> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +	__le64 *cdptr = smmu_domain->s1_cfg.table.ptr + ssid *
>>> +			CTXDESC_CD_DWORDS;>
>>> -	/* STALL_MODEL==0b10 && CD.S==0 is ILLEGAL */
>>> -	if (smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
>>> -		val |= CTXDESC_CD_0_S;
>>> +	val = le64_to_cpu(cdptr[0]);
>>> +	cd_live = !!(val & CTXDESC_CD_0_V);
>>>  
>>> -	cdptr[0] = cpu_to_le64(val);
>>> +	if (!cd) { /* (4) */
>>> +		val = 0;
>>> +	} else if (cd_live) { /* (3) */
>>> +		val &= ~CTXDESC_CD_0_ASID;
>>> +		val |= FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid);
>>> +		/*
>>> +		 * Until CD+TLB invalidation, both ASIDs may be used for tagging
>>> +		 * this substream's traffic
>>> +		 */
>>> +	} else { /* (1) and (2) */
>>> +		cdptr[1] = cpu_to_le64(cd->ttbr & CTXDESC_CD_1_TTB0_MASK);
>>> +		cdptr[2] = 0;
>>> +		cdptr[3] = cpu_to_le64(cd->mair);
>>> +
>>> +		/*
>>> +		 * STE is live, and the SMMU might fetch this CD at any
>>> +		 * time. Ensure that it observes the rest of the CD before we
>>> +		 * enable it.
>> Mostly, on't you want the invalid state to be seen?
Sorry I wanted to say you mostly want to enforce the INVALID bit (what I
understand from your below explanations). I was confused by the wording
"Ensure that it observes the rest of the CD before we enable it".
> 
> Sorry I didn't get your question. Without the sync, the SMMU could read an
> invalid address in CD[1], read V=1 in CD[0] and proceed with dereferencing
> the bogus pointer before seeing our update to CD[1].
> 
> To prevent this we follow the update procedure described in IHI0070Ca
> 3.21.3.1 (Configuration structure update procedure):
> 
>     Because the SMMU can read any reachable structure at any time, and is not
>     required to read the double-words of the structure in order, Arm
>     recommends that the following procedure is used to initialize structures:
>     1. Structure starts invalid, having V == 0.
>     2. Fill in all fields, leaving V == 0, then perform a DSB operation to
>        ensure written data is observable from the SMMU.
>     3. Issue a CMD_CFGI_<STRUCT>, as appropriate.
>     4. Issue a CMD_SYNC, and wait for completion.
>     5. Set V to 1, then perform a DSB operation to ensure write is
>        observable by the SMMU.
>     6. Issue CMD_CFGI_<STRUCT>, as appropriate.
>     7. Optionally issue a CMD_SYNC, and wait for completion. This must be
>        done if a subsequent software operation, such as enabling device
>        DMA, depends on the SMMU using the new structure.
> 
>>> @@ -1664,6 +1739,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>>  	if (s1_cfg) {
>>>  		BUG_ON(ste_live);
>>>  		dst[1] = cpu_to_le64(
>>> +			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
>>>  			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>>>  			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>>>  			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
>>> @@ -1674,7 +1750,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>>  			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
>>>  
>>>  		val |= (s1_cfg->table.ptr_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
>>> -			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS);
>>> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
>>> +			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
>>> +			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
>> Do I understand correctly that each time we update the CD, we also
>> update the STE. This is not wrong but theoretically this is not needed,
>> right?
> 
> Only the primary CD. Once we add SVA (or auxiliary domains) we need to
> update secondary CDs while the STE is live. This series is just
> preparation for SVA support. I didn't include the full support because it
> requires another 25+ patches.
OK
> 
>> This also explains why you do not need the CMD_PREFETCH_CONFIG with ssid
>> because you invalidate the config per sid?
> 
> Hm, I didn't add a CMD_PREFETCH_CONFIG to CDs because I don't know if it's
> useful. Maybe as future optimization.
OK

Thanks

Eric
> 
> Thanks,
> Jean
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
