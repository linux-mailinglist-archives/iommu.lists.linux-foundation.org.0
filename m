Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E464ACF11
	for <lists.iommu@lfdr.de>; Tue,  8 Feb 2022 03:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234ED404CA;
	Tue,  8 Feb 2022 02:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgLs5mvFYjn0; Tue,  8 Feb 2022 02:42:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 48E9540492;
	Tue,  8 Feb 2022 02:42:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 308E1C0073;
	Tue,  8 Feb 2022 02:42:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF88DC000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 02:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE60C817C3
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 02:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZrKSBzC1fZY for <iommu@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 02:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7138815AC
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644288123; x=1675824123;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B3yez2BcAz8vU5Mg4F8I9qz+pN7PVedtfJMQj6hn0Tw=;
 b=eE1hdZc7GPhf9Ing+dtzOmNfR+4n4W/Y5IHaYMoiMclUslyWE8cVjbqL
 dzII4HhIlv4lpXth5kWnMsnqB9al7Us16XsZfC6hK8chQaU24wGqTHMil
 YV6//jQxO1aFjv6MQ/AKxNMCVwsCAlgpF+1ddGYe3s+cIDUZUf1voXZCz
 7/zE1vIqKUA+x4IC4N7zLiOxO/Fb3M/fCtM4xGn8ZGYYHHLTMoUP0uhuz
 fZEZ1ZGrZlluexW2n2SOQ3QvvmtF6kE3FwvX7qjsWUjDkx+Tnn0BExs6t
 IRVKUxLBFpIJ7VmfkuOQX8my1a+uEIdQVptkAi6Wv3Q4SFmDbcdsv2kr9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249066428"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="249066428"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 18:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677965841"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 18:41:59 -0800
Message-ID: <fdf8ffbd-fc07-ca7e-937e-ef7aa39ed4ed@linux.intel.com>
Date: Tue, 8 Feb 2022 10:40:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/11] iommu/ioasid: Introduce a helper to check for
 valid PASIDs
Content-Language: en-US
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
References: <20220207230254.3342514-1-fenghua.yu@intel.com>
 <20220207230254.3342514-4-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
In-Reply-To: <20220207230254.3342514-4-fenghua.yu@intel.com>
Cc: iommu@lists.linux-foundation.org, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On 2/8/22 7:02 AM, Fenghua Yu wrote:
> pasid_valid() is defined to check if a given PASID is valid.
> 
> Suggested-by: Ashok Raj <ashok.raj@intel.com>
> Suggested-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> v4:
> - Add "Reviewed-by: Thomas Gleixner <tglx@linutronix.de>" (Thomas).
> 
> v2:
> - Define a helper pasid_valid() (Ashok, Jacob, Thomas, Tony)
> 
>   include/linux/ioasid.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> index e9dacd4b9f6b..2237f64dbaae 100644
> --- a/include/linux/ioasid.h
> +++ b/include/linux/ioasid.h
> @@ -41,6 +41,10 @@ void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
>   int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
>   void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
>   int ioasid_set_data(ioasid_t ioasid, void *data);
> +static inline bool pasid_valid(ioasid_t ioasid)
> +{
> +	return ioasid != INVALID_IOASID;
> +}
>   
>   #else /* !CONFIG_IOASID */
>   static inline ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
> @@ -78,5 +82,10 @@ static inline int ioasid_set_data(ioasid_t ioasid, void *data)
>   	return -ENOTSUPP;
>   }
>   
> +static inline bool pasid_valid(ioasid_t ioasid)
> +{
> +	return false;
> +}
> +
>   #endif /* CONFIG_IOASID */
>   #endif /* __LINUX_IOASID_H */

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
