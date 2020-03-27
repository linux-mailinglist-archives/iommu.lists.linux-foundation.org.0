Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E2195A96
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 17:06:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FD9085A00;
	Fri, 27 Mar 2020 16:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCQz-lS_y7do; Fri, 27 Mar 2020 16:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0919D8560B;
	Fri, 27 Mar 2020 16:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC391C1D8A;
	Fri, 27 Mar 2020 16:06:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BC5CC0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 16:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67D82887A0
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 16:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WZEUASdyNtm for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 16:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 966ED8879F
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585325168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rADClTuM8rDCPwa+pftuZtYBhIX2IPiWqkZ05BPZYE0=;
 b=YvqFNE8ocLlbbC/dzh48t/phYVg2fxiDs2BQCPrNNW28cXFy3lNb/WQ/4uOu0biMN5rpm7
 /f09CKQgpbYB7pj9gMlnwisChDur/R99E7BVG0lKkSrXjZ2zb7pqRInRekMwkAWaL7q+YJ
 /QF5wd+H0NGaU5mHnI8jSn+G5j2odA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-K_ZuWAB8M42Xkd9Far-IRA-1; Fri, 27 Mar 2020 12:06:05 -0400
X-MC-Unique: K_ZuWAB8M42Xkd9Far-IRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5251A8018A1;
 Fri, 27 Mar 2020 16:06:03 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 957C460304;
 Fri, 27 Mar 2020 16:05:54 +0000 (UTC)
Subject: Re: [PATCH V10 04/11] iommu/vt-d: Use helper function to skip agaw
 for SL
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584746861-76386-5-git-send-email-jacob.jun.pan@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED91C@SHSMSX104.ccr.corp.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <310693c3-9bd2-a764-2053-cd785d329ee6@redhat.com>
Date: Fri, 27 Mar 2020 17:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED91C@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Jonathan Cameron <jic23@kernel.org>
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

On 3/27/20 12:55 PM, Tian, Kevin wrote:
>> From: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Sent: Saturday, March 21, 2020 7:28 AM
>>
>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> ---
>>  drivers/iommu/intel-pasid.c | 14 ++++----------
>>  1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
>> index 191508c7c03e..9bdb7ee228b6 100644
>> --- a/drivers/iommu/intel-pasid.c
>> +++ b/drivers/iommu/intel-pasid.c
>> @@ -544,17 +544,11 @@ int intel_pasid_setup_second_level(struct
>> intel_iommu *iommu,
>>  		return -EINVAL;
>>  	}
>>
>> -	/*
>> -	 * Skip top levels of page tables for iommu which has less agaw
>> -	 * than default. Unnecessary for PT mode.
>> -	 */
>>  	pgd = domain->pgd;
>> -	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
>> -		pgd = phys_to_virt(dma_pte_addr(pgd));
>> -		if (!dma_pte_present(pgd)) {
>> -			dev_err(dev, "Invalid domain page table\n");
>> -			return -EINVAL;
>> -		}
>> +	agaw = iommu_skip_agaw(domain, iommu, &pgd);
>> +	if (agaw < 0) {
>> +		dev_err(dev, "Invalid domain page table\n");
is the dev_err() really requested. I see in domain_setup_first_level(),
there is none.
>> +		return -EINVAL;
>>  	}
> 
> ok, I see how it is used. possibly combine last and this one together since
> it's mostly moving code...

I tend to agree with Kevin. May be better squash the 2 patches. Also not
sure the inline of iommu_skip_agaw() is meaningful then. Also Add commit
messages on the resulting patch.

Note domain_setup_first_level() also could use the helper while we are
it (if declaration moved to common helper). Only the error code differs
in case !dma_pte_present(pgd), ie. -ENOMEM. May be good to align.

Otherwise those stuff may be done in a fixup patch.

Thanks

Eric
> 
>>
>>  	pgd_val = virt_to_phys(pgd);
>> --
>> 2.7.4
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
