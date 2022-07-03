Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF525644C2
	for <lists.iommu@lfdr.de>; Sun,  3 Jul 2022 06:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32B4400EC;
	Sun,  3 Jul 2022 04:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32B4400EC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0J6GW83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jq82p-BrBvyR; Sun,  3 Jul 2022 04:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ED8A040332;
	Sun,  3 Jul 2022 04:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8A040332
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8BE9C007C;
	Sun,  3 Jul 2022 04:35:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08FEAC002D
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jul 2022 04:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C97AF82F76
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jul 2022 04:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97AF82F76
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=i0J6GW83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyOKNQuPV7W7 for <iommu@lists.linux-foundation.org>;
 Sun,  3 Jul 2022 04:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385B482F57
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 385B482F57
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jul 2022 04:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656822921; x=1688358921;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pU3gfZt21o7N90tOYZMfEo8wFf2wBbFCrf4XK6NkYGQ=;
 b=i0J6GW837YWpP1uSfhzYKdiTv5NMrelxhzfhho5XfUT2YFzQ2XS5jv4z
 Aoo+iYRjvGTkVSsRiYzL/PtJ8TWqhZXIh8IVelF4zoAhBxkjn3XzDOJH6
 ZtdGVMVNQLnDsjbFwL6DGPlyKVeNhDRf7Uz0EofKgxuDx3fVTkk+HsNTC
 pN/RXex4UY0QRwo8qU7h0b9SSV4mQ34WlE+67ZxtJ6L9E/WchvWqbSLjK
 loGgAZTNnJ6qJxpJCI6XSfLtRTAZgLbBD5Ao6kMv8OqxmHrZXiaHYTJrd
 L/Isx3SUW0QE2yw9EBvjvxWQR240WtBvWJ0iSwAM5cUvS0vWIbD4ofcbG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="283631376"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="283631376"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2022 21:35:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="648966391"
Received: from sunqi-mobl1.ccr.corp.intel.com (HELO [10.249.173.69])
 ([10.249.173.69])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2022 21:35:18 -0700
Message-ID: <49a1839a-c99d-258a-8f85-5a291c646038@linux.intel.com>
Date: Sun, 3 Jul 2022 12:35:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 10/11] iommu/vt-d: Use device_domain_lock accurately
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <20220629074725.2331441-1-baolu.lu@linux.intel.com>
 <20220629074725.2331441-11-baolu.lu@linux.intel.com>
 <BN9PR11MB52763F336B2535BC89E2C7498CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52763F336B2535BC89E2C7498CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>
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

On 2022/7/1 16:15, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Wednesday, June 29, 2022 3:47 PM
>>
>> +	spin_lock_irqsave(&device_domain_lock, flags);
>>   	list_for_each_entry(info, &domain->devices, link) {
>> -		if (!info->dev)
>> -			continue;
>> -
> 
> suppose you can replace all spin_lock_irqsave() with spin_lock()
> in patch5 instead of leaving some replacement to next patch.
> 

Make sense to me. Will update this.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
