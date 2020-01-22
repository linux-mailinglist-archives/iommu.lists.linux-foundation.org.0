Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604F144B69
	for <lists.iommu@lfdr.de>; Wed, 22 Jan 2020 06:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB8D020764;
	Wed, 22 Jan 2020 05:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvCXcM+DBO4x; Wed, 22 Jan 2020 05:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E3DE9203A3;
	Wed, 22 Jan 2020 05:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7F70C0174;
	Wed, 22 Jan 2020 05:45:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2F17C0174
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BBC38859BD
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6iCYX5+ZK5G for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 05:45:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2DC95859AE
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 05:45:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 21:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="215793095"
Received: from allen-box.sh.intel.com (HELO [10.239.159.138])
 ([10.239.159.138])
 by orsmga007.jf.intel.com with ESMTP; 21 Jan 2020 21:45:11 -0800
Subject: Re: [PATCH] iommu/vt-d: call __dmar_remove_one_dev_info with valid
 pointer
To: Jerry Snitselaar <jsnitsel@redhat.com>, iommu@lists.linux-foundation.org
References: <20200122003426.16079-1-jsnitsel@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <ac036343-18a2-de7e-6bc2-45966f429c16@linux.intel.com>
Date: Wed, 22 Jan 2020 13:43:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200122003426.16079-1-jsnitsel@redhat.com>
Content-Language: en-US
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On 1/22/20 8:34 AM, Jerry Snitselaar wrote:
> It is possible for archdata.iommu to be set to
> DEFER_DEVICE_DOMAIN_INFO or DUMMY_DEVICE_DOMAIN_INFO so check for
> those values before calling __dmar_remove_one_dev_info. Without a
> check it can result in a null pointer dereference. This has been seen
> while booting a kdump kernel on an HP dl380 gen9.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: stable@vger.kernel.org # 5.3+
> Cc: linux-kernel@vger.kernel.org
> Fixes: ae23bfb68f28 ("iommu/vt-d: Detach domain before using a private one")
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
