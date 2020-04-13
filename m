Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0881A696C
	for <lists.iommu@lfdr.de>; Mon, 13 Apr 2020 18:08:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 65B98203A0;
	Mon, 13 Apr 2020 16:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QqeymEa-NqD; Mon, 13 Apr 2020 16:08:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 58F5A20419;
	Mon, 13 Apr 2020 16:08:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46549C0172;
	Mon, 13 Apr 2020 16:08:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 265A3C0172
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 16:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 20573878ED
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 16:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miNo2a6J55CJ for <iommu@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 16:08:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47018878BB
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 16:08:26 +0000 (UTC)
IronPort-SDR: HuYtOtEMAt1XfHPyqthHtGjixHhPjAlhJkZz4Ev56lTyU0afvMzsIQ+tJGfIM3jqMUEpu9+0YV
 1HojiHDmIHFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 09:08:17 -0700
IronPort-SDR: AtFFhp8S7rumfycaYYh+yKRUS57LlGaHKanXMToLuDp8lsQWCJ+C9Rc5oGIx5Ek+dW6G0z+zaq
 pNw/I478q4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="363109095"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2020 09:08:16 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX105.amr.corp.intel.com ([169.254.2.15]) with mapi id 14.03.0439.000;
 Mon, 13 Apr 2020 09:08:16 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "drake@endlessm.com" <drake@endlessm.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: use DMA domain for real DMA devices and
 subdevices
Thread-Topic: [PATCH 1/1] iommu/vt-d: use DMA domain for real DMA devices
 and subdevices
Thread-Index: AQHWDqWd+ubRYvzlTkCJBotC6+FAWah1UvmAgAJgjoA=
Date: Mon, 13 Apr 2020 16:08:16 +0000
Message-ID: <3dc512548fbd40bd00c14ee237eaf293e3d1ecde.camel@intel.com>
References: <20200409191736.6233-1-jonathan.derrick@intel.com>
 <20200409191736.6233-2-jonathan.derrick@intel.com>
 <CAD8Lp442LO1Sq5xpKOaRUKLsEyGbou4TiHQrDdnMbCOV-TG0+g@mail.gmail.com>
In-Reply-To: <CAD8Lp442LO1Sq5xpKOaRUKLsEyGbou4TiHQrDdnMbCOV-TG0+g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.0.111]
Content-ID: <9B343A591B4C844FB4371E1F47CE2845@intel.com>
MIME-Version: 1.0
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>,
 "linux@endlessm.com" <linux@endlessm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sun, 2020-04-12 at 11:50 +0800, Daniel Drake wrote:
> Hi Jon,
> 
> Thanks for picking this up. Apologies for my absence here - I wasn't
> able to work on this recently, but I'm back again now.
> 
> On Fri, Apr 10, 2020 at 3:32 AM Jon Derrick <jonathan.derrick@intel.com> wrote:
> > This becomes problematic if the real DMA device and the subdevices have
> > different addressing capabilities and some require translation. Instead we can
> > put the real DMA dev and any subdevices on the DMA domain. This change assigns
> > subdevices to the DMA domain, and moves the real DMA device to the DMA domain
> > if necessary.
> 
> Have you tested this with the real DMA device in identity mode?
> It is not quite working for me. (Again, I'm not using VMD here, but
> have looked closely and believe we're working under the same
> constraints)

It does work for me when real DMA device starts in Identity, but my
'real DMA device' doesn't do the DMA. It just provides the source-id.

Does your 'real DMA device' do DMA?
I suppose that could be the reason. You wouldn't want to change the
domain on the live device using the method I proposed.

> 
> First, the real DMA device gets added to the group:
>  pci 0000:00:17.0: Adding to iommu group 9
> (it's in IDENTITY mode here)
> 
> Then later, the first subdevice comes along, and these are the results:
>  pci 10000:00:00.0: [8086:02d7] type 00 class 0x010601
>  pci 10000:00:00.0: reg 0x10: [mem 0xae1a0000-0xae1a7fff]
>  pci 10000:00:00.0: reg 0x14: [mem 0xae1a8000-0xae1a80ff]
>  pci 10000:00:00.0: reg 0x18: [io  0x3090-0x3097]
>  pci 10000:00:00.0: reg 0x1c: [io  0x3080-0x3083]
>  pci 10000:00:00.0: reg 0x20: [io  0x3060-0x307f]
>  pci 10000:00:00.0: reg 0x24: [mem 0xae100000-0xae103fff]
>  pci 10000:00:00.0: PME# supported from D3hot
>  pci 10000:00:00.0: Adding to iommu group 9
>  pci 10000:00:00.0: DMAR: Failed to get a private domain.
> 
> That final message is added by your patch and indicates that it's not working.
> 
> This is because the subdevice got added to the iommu group before the
> code you added tried to change to the DMA domain.
> 
> It first gets added to the group through this call path:
>     intel_iommu_add_device
> -> iommu_group_get_for_dev
> -> iommu_group_add_device
> 
> Then, continuing within intel_iommu_add_device we get to the code you
> added, which tries to move the real DMA dev to DMA mode instead. It
> calls:
> 
>    intel_iommu_request_dma_domain_for_dev
> -> iommu_request_dma_domain_for_dev
> -> request_default_domain_for_dev
> 
> Which fails here:
>     /* Don't change mappings of existing devices */
>     ret = -EBUSY;
>     if (iommu_group_device_count(group) != 1)
>         goto out;
> 
> because we already have 2 devices in the group (the real DMA dev, plus
> the subdevice we're in the process of handling now).
> 

You're right. I see the message too, but it still works for me.

> Next I'll look into the iommu group rework that Baolu mentioned.
> 
> Thanks,
> Daniel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
