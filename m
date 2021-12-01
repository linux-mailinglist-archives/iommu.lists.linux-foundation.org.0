Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6CF465850
	for <lists.iommu@lfdr.de>; Wed,  1 Dec 2021 22:21:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 953868266D;
	Wed,  1 Dec 2021 21:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKoHX4dsi3SL; Wed,  1 Dec 2021 21:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B4C298174C;
	Wed,  1 Dec 2021 21:21:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20543C002E;
	Wed,  1 Dec 2021 21:21:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDB69C000A
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 21:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A50607A5
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 21:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gf4imkpNVsD2 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Dec 2021 21:21:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBFB96073D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 21:21:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236502703"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; d="scan'208";a="236502703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 13:21:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; d="scan'208";a="602309136"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.212.64.69])
 ([10.212.64.69])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 13:21:16 -0800
Message-ID: <f4cc305b-a329-6d27-9fca-b74ebc9fa0c1@intel.com>
Date: Wed, 1 Dec 2021 14:21:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>
References: <20211126230957.239391799@linutronix.de>
 <20211126232735.547996838@linutronix.de>
 <7daba0e2-73a3-4980-c3a5-a71f6b597b22@deltatee.com> <874k7ueldt.ffs@tglx>
 <6ba084d6-2b26-7c86-4526-8fcd3d921dfd@deltatee.com> <87ilwacwp8.ffs@tglx>
 <d6f13729-1b83-fa7d-3f0d-98d4e3f7a2aa@deltatee.com> <87v909bf2k.ffs@tglx>
 <20211130202800.GE4670@nvidia.com> <87o861banv.ffs@tglx>
 <20211201001748.GF4670@nvidia.com> <87mtlkaauo.ffs@tglx>
 <8c2262ba-173e-0007-bc4c-94ec54b2847d@intel.com> <87pmqg88xq.ffs@tglx>
 <df00b87e-00dc-d998-8b64-46b16dba46eb@intel.com> <87k0go8432.ffs@tglx>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <87k0go8432.ffs@tglx>
Cc: Allen Hubbe <allenbh@gmail.com>, linux-s390@vger.kernel.org,
 Kevin Tian <kevin.tian@intel.com>, x86@kernel.org,
 Ashok Raj <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zygnier <maz@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 linux-ntb@googlegroups.com, Logan Gunthorpe <logang@deltatee.com>,
 Megha Dey <megha.dey@intel.com>
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


On 12/1/2021 1:25 PM, Thomas Gleixner wrote:
> On Wed, Dec 01 2021 at 11:47, Dave Jiang wrote:
>> On 12/1/2021 11:41 AM, Thomas Gleixner wrote:
>>>> Hi Thomas. This is actually the IDXD usage for a mediated device passed
>>>> to a guest kernel when we plumb the pass through of IMS to the guest
>>>> rather than doing previous implementation of having a MSIX vector on
>>>> guest backed by IMS.
>>> Which makes a lot of sense.
>>>
>>>> The control block for the mediated device is emulated and therefore an
>>>> emulated MSIX vector will be surfaced as vector 0. However the queues
>>>> will backed by IMS vectors. So we end up needing MSIX and IMS coexist
>>>> running on the guest kernel for the same device.
>>> Why? What's wrong with using straight MSI-X for all of them?
>> The hardware implementation does not have enough MSIX vectors for
>> guests. There are only 9 MSIX vectors total (8 for queues) and 2048 IMS
>> vectors. So if we are to do MSI-X for all of them, then we need to do
>> the IMS backed MSIX scheme rather than passthrough IMS to guests.
> Confused. Are you talking about passing a full IDXD device to the guest
> or about passing a carved out subdevice, aka. queue?

I'm talking about carving out a subdevice. I had the impression of you 
wanting IMS passed through for all variations. But it sounds like for a 
sub-device, you are ok with the implementation of MSIX backed by IMS?


>
> Thanks,
>
>          tglx
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
