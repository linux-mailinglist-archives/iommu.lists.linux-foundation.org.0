Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B37141C9C
	for <lists.iommu@lfdr.de>; Sun, 19 Jan 2020 07:30:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F0AA0851CB;
	Sun, 19 Jan 2020 06:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fgzKoMmaa4h; Sun, 19 Jan 2020 06:30:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 571BE8589C;
	Sun, 19 Jan 2020 06:30:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49A82C0176;
	Sun, 19 Jan 2020 06:30:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC779C0174
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 06:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA3FC8589C
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 06:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQjosmqrWF1P for <iommu@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 06:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EE781851CB
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 06:30:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 22:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,337,1574150400"; d="scan'208";a="214929065"
Received: from allen-box.sh.intel.com (HELO [10.239.159.138])
 ([10.239.159.138])
 by orsmga007.jf.intel.com with ESMTP; 18 Jan 2020 22:30:43 -0800
Subject: Re: [RFC PATCH 3/4] iommu: Preallocate iommu group when probing
 devices
To: Joerg Roedel <joro@8bytes.org>
References: <20200101052648.14295-1-baolu.lu@linux.intel.com>
 <20200101052648.14295-4-baolu.lu@linux.intel.com>
 <20200117102151.GF15760@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <25e2e7fa-487c-f951-4b2c-27bac5e30815@linux.intel.com>
Date: Sun, 19 Jan 2020 14:29:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200117102151.GF15760@8bytes.org>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi Joerg,

On 1/17/20 6:21 PM, Joerg Roedel wrote:
> On Wed, Jan 01, 2020 at 01:26:47PM +0800, Lu Baolu wrote:
>> This splits iommu group allocation from adding devices. This makes
>> it possible to determine the default domain type for each group as
>> all devices belonging to the group have been determined.
> 
> I think its better to keep group allocation as it is and just defer
> default domain allocation after each device is in its group. But take

I tried defering default domain allocation, but it seems not possible.

The call path of adding devices into their groups:

iommu_probe_device
-> ops->add_device(dev)
    -> (iommu vendor driver) iommu_group_get_for_dev(dev)

After doing this, the vendor driver will get the default domain and
apply dma_ops according to the domain type. If we defer the domain
allocation, they will get a NULL default domain and cause panic in
the vendor driver.

Any suggestions?

Best regards,
baolu

> care about the device hotplug path which might add new devices to groups
> which already have a default domain, or add new groups that might need a
> default domain too.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
