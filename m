Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2C3A0DF2
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:43:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44638608E9;
	Wed,  9 Jun 2021 07:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYT7AV06WdJK; Wed,  9 Jun 2021 07:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 79E7A608C4;
	Wed,  9 Jun 2021 07:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5563EC000B;
	Wed,  9 Jun 2021 07:43:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B005C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8938C404B9
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkTtPaeaKZ57 for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:43:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBAF8404B6
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:43:15 +0000 (UTC)
IronPort-SDR: 3WdvRSMGTPUeCd9RsWTvlV98H0nwpw5UAbuoGBtrZSoA/ZGEyhp72E+30GquQsE+dBhozIh9LJ
 wlVGHjsqvoFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="226389293"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="226389293"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:43:15 -0700
IronPort-SDR: HnDCS4+nCKuu3tCwI/PtgKDqTwENFG1lTzv7Vy0x364pm/g80y9lD+IXDCddFK7IqUJcfKs1Xi
 1xqN0pUq6syg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="552589925"
Received: from allen-box.sh.intel.com (HELO [10.239.159.105])
 ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2021 00:43:13 -0700
Subject: Re: [PATCH -next] iommu/vt-d: use DEVICE_ATTR_RO macro
To: YueHaibing <yuehaibing@huawei.com>, dwmw2@infradead.org, joro@8bytes.org, 
 will@kernel.org
References: <20210528130229.22108-1-yuehaibing@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <4ce91672-a0e4-c1f6-4e8c-e926e03cfddd@linux.intel.com>
Date: Wed, 9 Jun 2021 15:41:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528130229.22108-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On 5/28/21 9:02 PM, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing<yuehaibing@huawei.com>

Queued for v5.14. Thanks!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
