Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B789139F43
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 03:00:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31A6E855CE;
	Tue, 14 Jan 2020 02:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEINECiuvg1d; Tue, 14 Jan 2020 01:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DDEE854E5;
	Tue, 14 Jan 2020 01:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 336AFC077D;
	Tue, 14 Jan 2020 01:59:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6E3C077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 01:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 537C6203F1
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 01:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9zmUbaiwyvV for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 01:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 17679203EC
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 01:59:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 17:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; d="scan'208";a="305011243"
Received: from unknown (HELO [10.239.159.138]) ([10.239.159.138])
 by orsmga001.jf.intel.com with ESMTP; 13 Jan 2020 17:59:53 -0800
Subject: Re: [RFC 2/5] iommu/vt-d: Unlink device if failed to add to group
To: Joerg Roedel <joro@8bytes.org>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-3-git-send-email-jonathan.derrick@intel.com>
 <e45b00d9-579b-e141-e704-7084fe05bd29@linux.intel.com>
 <20200113122045.GE28359@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <ef5d2869-b334-b924-1796-836336f786e9@linux.intel.com>
Date: Tue, 14 Jan 2020 09:58:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113122045.GE28359@8bytes.org>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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

On 1/13/20 8:20 PM, Joerg Roedel wrote:
> On Sun, Jan 12, 2020 at 09:36:56AM +0800, Lu Baolu wrote:
>> On 1/1/20 4:24 AM, Jon Derrick wrote:
>>> If the device fails to be added to the group, make sure to unlink the
>>> reference before returning.
>>>
>>> Signed-off-by: Jon Derrick<jonathan.derrick@intel.com>
>>
>> Queued for v5.6.
> 
> No need to do so, I sent it upstream with the last pile of iommu fixes.

Got it. Thank you!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
