Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 488075697E7
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 04:22:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0213340256;
	Thu,  7 Jul 2022 02:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0213340256
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J5VgCn6s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQ4KV5KpaMgm; Thu,  7 Jul 2022 02:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B696640228;
	Thu,  7 Jul 2022 02:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B696640228
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70E4BC0077;
	Thu,  7 Jul 2022 02:22:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 427E1C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 02:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11052401AF
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 02:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11052401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpl7cJZHEUVe for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 02:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB25418A7
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDB25418A7
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657160557; x=1688696557;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ma0fFXFw3M8lIkxpmBs0YMy6P2ngSlPcwZQt0WJ6T3A=;
 b=J5VgCn6scDc+YsrUa7jCztYYPkHpHGfKtXSZN2xbY8jXgZ2+oNOQS7Bc
 gS+F01H2rYRWN+i79NaLybuBPEsSmdfvW7QM2TNAbxcVwSiu9rrXUvhGT
 Ez0MiqFu+kFPD8lDyKE1rmuNWSSc4tmRuO98RDG6rUjok15gF+BCaIlpG
 cO3LuvuXbrhaqGm+0Kc4ho+pokjZHjoeUPvt9LyeQy2VOpjsAbK0H2Rip
 csnZTMNpDzGksxDyx12kzZo6koqyjQrTRVfBJOFBLNz7V6kaX6b1Q75c6
 Hpsv32DWSeos1xqS0swzxxZFPe1GwpfaeSth7fe9yeXrH1j7J+Rnz2M5Y g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="263698008"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="263698008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 19:22:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650925601"
Received: from hualiu-mobl1.ccr.corp.intel.com (HELO [10.249.171.209])
 ([10.249.171.209])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 19:22:34 -0700
Message-ID: <c2a378eb-0107-ea10-1b9a-a8bdfd7ec71a@linux.intel.com>
Date: Thu, 7 Jul 2022 10:22:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/6] iommu/vt-d: Refactor iommu information of each
 domain
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Steve Wahl <steve.wahl@hpe.com>
References: <20220702015610.2849494-1-baolu.lu@linux.intel.com>
 <20220702015610.2849494-4-baolu.lu@linux.intel.com>
 <BN9PR11MB52764D1132C2AB21B0A2A1B48C839@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52764D1132C2AB21B0A2A1B48C839@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: Dimitri Sivanich <sivanich@hpe.com>, "Anderson,
 Russ" <russ.anderson@hpe.com>, Mike Travis <mike.travis@hpe.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 David Woodhouse <dwmw2@infradead.org>
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

On 2022/7/7 09:01, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Saturday, July 2, 2022 9:56 AM
>>
>> -out_unlock:
>> +	set_bit(num, iommu->domain_ids);
>> +	info->refcnt	= 1;
>> +	info->did	= num;
>> +	info->iommu	= iommu;
>> +	domain->nid	= iommu->node;
> 
> One nit. this line should be removed as it's incorrect to blindly update
> domain->nid and we should just leave to domain_update_iommu_cap()
> to decide the right node. Otherwise this causes a policy conflict as
> here it is the last attached device deciding the node which is different
> from domain_update_iommu_cap() which picks the node of the first
> attached device.

Agreed and updated. Thank you!

> 
> Otherwise,
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
