Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99B11A0E3
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 02:57:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1DC86BA4;
	Wed, 11 Dec 2019 01:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfLhfTomHgbL; Wed, 11 Dec 2019 01:57:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCFF186C04;
	Wed, 11 Dec 2019 01:57:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B09A0C1D83;
	Wed, 11 Dec 2019 01:57:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BFA4C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 01:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 879D8860B5
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 01:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvMXS4IXfI8x for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 01:57:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D050785CC7
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 01:57:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 17:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="225349071"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 10 Dec 2019 17:57:37 -0800
Subject: Re: [PATCH v2 5/8] iommu/vt-d: Add first level page table interfaces
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20191128022550.9832-1-baolu.lu@linux.intel.com>
 <20191128022550.9832-6-baolu.lu@linux.intel.com>
 <20191202152732.3d9c6589@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <8fd5d2fe-51c7-3ee7-fcda-625082e23040@linux.intel.com>
Date: Wed, 11 Dec 2019 09:56:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191202152732.3d9c6589@jacob-builder>
Content-Language: en-US
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
 ashok.raj@intel.com, kvm@vger.kernel.org, sanjay.k.kumar@intel.com,
 yi.y.sun@intel.com, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
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

Hi Jacob,

On 12/3/19 7:27 AM, Jacob Pan wrote:
> On Thu, 28 Nov 2019 10:25:47 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> This adds functions to manipulate first level page tables
>> which could be used by a scalale mode capable IOMMU unit.
>>
> FL and SL page tables are very similar, and I presume we are not using
> all the flag bits in FL paging structures for DMA mapping. Are there
> enough relevant differences to warrant a new set of helper functions
> for FL? Or we can merge into one.

I evaluated your suggestion these days. It turned out that your
suggestion make code simpler and easier for maintainence. Thank you for
the comment and I will send out a new version for review soon.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
