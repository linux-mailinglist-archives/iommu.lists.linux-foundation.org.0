Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A23998CA
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 06:02:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217CC40594;
	Thu,  3 Jun 2021 04:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dk0tCGDa3vT6; Thu,  3 Jun 2021 04:02:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B384058B;
	Thu,  3 Jun 2021 04:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8FBCC0001;
	Thu,  3 Jun 2021 04:02:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99119C0001;
 Thu,  3 Jun 2021 04:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867D383E09;
 Thu,  3 Jun 2021 04:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfA97FLNJ1ME; Thu,  3 Jun 2021 04:02:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D27EB83E08;
 Thu,  3 Jun 2021 04:02:32 +0000 (UTC)
IronPort-SDR: mVpzNk6y6YWwK7beMVFzhc1Y0XqwW4KO45Nry1g4ObQPnpU/El3h4GUBxn9SipXYDR3RG6cf1x
 qH5GROFika2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="184329278"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="184329278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:02:31 -0700
IronPort-SDR: eEPbiSnatcxwFz1MIHAGiqlURWg97YVMLLchQhh6e6iCeiUcbEie29Jt0yKv9fUFRmBH2QL+yg
 Gh0zCTGCIDmA==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="417188440"
Received: from sboinap-mobl1.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.209.150.149])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:02:31 -0700
Subject: Re: [PATCH v1 4/8] x86/tdx: Add arch_has_restricted_memory_access for
 TDX
To: Andi Kleen <ak@linux.intel.com>, mst@redhat.com
References: <20210603004133.4079390-1-ak@linux.intel.com>
 <20210603004133.4079390-5-ak@linux.intel.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <2dd6a4a1-e5f7-23e2-9c5b-abfe8ff20e79@linux.intel.com>
Date: Wed, 2 Jun 2021 21:02:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603004133.4079390-5-ak@linux.intel.com>
Content-Language: en-US
Cc: jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 jpoimboe@redhat.com, robin.murphy@arm.com, hch@lst.de
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



On 6/2/21 5:41 PM, Andi Kleen wrote:
> +int arch_has_restricted_virtio_memory_access(void)
> +{
> +	return is_tdx_guest();
> +}
> +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> +

This function definition had to be removed from arch/x86/mm/mem_encrypt.c.

Otherwise, if you enable both CONFIG_AMD_MEM_ENCRYPT,
CONFIG_X86_MEM_ENCRYPT_COMMON it will generate multiple definition error.

--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -493,9 +493,3 @@ void __init amd_mem_encrypt_init(void)

         print_mem_encrypt_feature_info();
  }
-
-int arch_has_restricted_virtio_memory_access(void)
-{
-       return sev_active();
-}
-EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);

--- a/arch/x86/mm/mem_encrypt_common.c
+++ b/arch/x86/mm/mem_encrypt_common.c
@@ -40,7 +40,7 @@ void __init mem_encrypt_init(void)

  int arch_has_restricted_virtio_memory_access(void)
  {
-       return is_tdx_guest();
+       return (is_tdx_guest() || sev_active());
  }
  EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
