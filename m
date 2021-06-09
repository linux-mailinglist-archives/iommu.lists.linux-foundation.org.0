Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860A3A0DE4
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:40:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08113832C6;
	Wed,  9 Jun 2021 07:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEnOTtZcvJQ1; Wed,  9 Jun 2021 07:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 21E6E832C7;
	Wed,  9 Jun 2021 07:39:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1390C000B;
	Wed,  9 Jun 2021 07:39:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BFC6C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0987260672
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYvN4_vstjgl for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:39:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8104A60071
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:39:55 +0000 (UTC)
IronPort-SDR: 61KMGQTMVfbknsmsawbGLIHKpJc8KYj9KZPGtJVRQnUTiqWQzzhUTDBbTT3Guactvg2cAeegq5
 lRaG39jh+RvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266176713"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="266176713"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:39:54 -0700
IronPort-SDR: AYtn74xIwP8My0IIMbt5vdLIRcpsAeU0Wcq1r9Tv+oWPyUlWLIDCE17iGrDeZRwr9pshWLHezV
 EL0X2dzYoaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="552588883"
Received: from allen-box.sh.intel.com (HELO [10.239.159.105])
 ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2021 00:39:51 -0700
Subject: Re: [PATCH] iommu/vt-d: fix kernel-doc syntax in file header
To: Aditya Srivastava <yashsri421@gmail.com>, will@kernel.org
References: <20210523143245.19040-1-yashsri421@gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cb50b161-5a72-7eb6-f912-3583ebd75d33@linux.intel.com>
Date: Wed, 9 Jun 2021 15:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523143245.19040-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, lukas.bulwahn@gmail.com, dwmw2@infradead.org
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

On 5/23/21 10:32 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/iommu/intel/pasid.c follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc:
> warning: Function parameter or member 'fmt' not described in 'pr_fmt'
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava<yashsri421@gmail.com>

Queued for v5.14. Thanks!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
