Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3E1853D1
	for <lists.iommu@lfdr.de>; Sat, 14 Mar 2020 02:23:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC5F587B6E;
	Sat, 14 Mar 2020 01:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQ0NAyCFFCOn; Sat, 14 Mar 2020 01:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54D6687B6C;
	Sat, 14 Mar 2020 01:23:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D089C0177;
	Sat, 14 Mar 2020 01:23:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C16BCC0177
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 01:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A2E68898A0
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 01:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YArLnjxw9gGS for <iommu@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 01:23:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E153C89894
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 01:23:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 18:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,550,1574150400"; d="scan'208";a="354495112"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.208.137])
 ([10.254.208.137])
 by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2020 18:23:22 -0700
Subject: Re: [PULL REQUEST] iommu/vt-d: fixes for v5.6
To: Joerg Roedel <joro@8bytes.org>
References: <20200312060955.8523-1-baolu.lu@linux.intel.com>
 <20200313134610.GQ3794@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <a50215c9-0368-2560-da50-381121f5541e@linux.intel.com>
Date: Sat, 14 Mar 2020 09:23:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200313134610.GQ3794@8bytes.org>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org
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

On 2020/3/13 21:46, Joerg Roedel wrote:
> On Thu, Mar 12, 2020 at 02:09:53PM +0800, Lu Baolu wrote:
>> Daniel Drake (1):
>>    iommu/vt-d: Ignore devices with out-of-spec domain number

Fixes: 59ce0515cdaf3 ("iommu/vt-d: Update DRHD/RMRR/ATSR device scope
caches when PCI hotplug happens")

>>
>> Zhenzhong Duan (1):
>>    iommu/vt-d: Fix the wrong printing in RHSA parsing

Fixes: fd0c8894893cb ("intel-iommu: Set a more specific taint flag for
invalid BIOS DMAR tables")

> 
> Btw, these two probably need fixes tags, can you provide them please?
> 

Sure.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
