Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE7214BAB
	for <lists.iommu@lfdr.de>; Sun,  5 Jul 2020 11:54:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0848387D9F;
	Sun,  5 Jul 2020 09:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MeHMVjZpk3i; Sun,  5 Jul 2020 09:54:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1DE7387DB4;
	Sun,  5 Jul 2020 09:54:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE474C016F;
	Sun,  5 Jul 2020 09:54:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6612EC016F
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jul 2020 09:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C413203B5
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jul 2020 09:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8saKFmjFkkR for <iommu@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 09:54:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by silver.osuosl.org (Postfix) with ESMTPS id A3200203A9
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jul 2020 09:54:13 +0000 (UTC)
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 1233445E69CF5014C674;
 Sun,  5 Jul 2020 17:54:06 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.177]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Sun, 5 Jul 2020 17:53:59 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Will Deacon <will@kernel.org>
Subject: RE: [PATCH] iommu/arm-smmu-v3: expose numa_node attribute to users
 in sysfs
Thread-Topic: [PATCH] iommu/arm-smmu-v3: expose numa_node attribute to users
 in sysfs
Thread-Index: AQHWUVYP5+oz7AgxZUmeNHR/kRBG2aj4ucrQ
Date: Sun, 5 Jul 2020 09:53:58 +0000
Message-ID: <B926444035E5E2439431908E3842AFD25559F2@DGGEMI525-MBS.china.huawei.com>
References: <20200530091505.56664-1-song.bao.hua@hisilicon.com>
 <20200703162137.GA19780@willie-the-truck>
In-Reply-To: <20200703162137.GA19780@willie-the-truck>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



> -----Original Message-----
> From: Will Deacon [mailto:will@kernel.org]
> Sent: Saturday, July 4, 2020 4:22 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: robin.murphy@arm.com; hch@lst.de; m.szyprowski@samsung.com;
> iommu@lists.linux-foundation.org; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH] iommu/arm-smmu-v3: expose numa_node attribute to
> users in sysfs
> 
> On Sat, May 30, 2020 at 09:15:05PM +1200, Barry Song wrote:
> > As tests show the latency of dma_unmap can increase dramatically while
> > calling them cross NUMA nodes, especially cross CPU packages, eg.
> > 300ns vs 800ns while waiting for the completion of CMD_SYNC in an
> > empty command queue. The large latency causing by remote node will
> > in turn make contention of the command queue more serious, and enlarge
> > the latency of DMA users within local NUMA nodes.
> >
> > Users might intend to enforce NUMA locality with the consideration of
> > the position of SMMU. The patch provides minor benefit by presenting
> > this information to users directly, as they might want to know it without
> > checking hardware spec at all.
> 
> I don't think that's a very good reason to expose things to userspace.
> I know sysfs shouldn't be treated as ABI, but the grim reality is that
> once somebody relies on this stuff then we can't change it, so I'd
> rather avoid exposing it unless it's absolutely necessary.

Will, thanks for taking a look!

I am not sure if it is absolutely necessary, but it is useful to users. The whole story started
from some users who wanted to know the hardware topology very clear by reading some
sysfs node just like they are able to do that for pci devices. The intention is that users can
know hardware topology of various devices easily from linux since they maybe don't know
all the hardware details.

For pci devices, kernel has done that. And there are some other drivers out of pci
exposing numa_node as well. It seems it is hard to say it is absolutely necessary
for them too since sysfs shouldn't be treated as ABI. 

I got some input from Linux users who also wanted to know the numa node for
other devices which are not PCI, for example, platform devices. And I thought the
requirement is kind of reasonable. So I also had another patch to generally support
this kind of requirements, with the below patch, this smmu patch is not necessary
any more:
https://lkml.org/lkml/2020/6/18/1257

for platform device created by ARM ACPI/IORT and general acpi_create_platform_device()
drivers/acpi/scan.c:
static void acpi_default_enumeration(struct acpi_device *device)
{
	...
	if (!device->flags.enumeration_by_parent) {
		acpi_create_platform_device(device, NULL);
		acpi_device_set_enumerated(device);
	}
}

struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
					struct property_entry *properties)
{
	...

	pdev = platform_device_register_full(&pdevinfo);
	if (IS_ERR(pdev))
		...
	else {
		set_dev_node(&pdev->dev, acpi_get_node(adev->handle));
		...
	}
	...
}
numa_node is set for this kind of devices.

Anyway, just want to explain to you the background some people want to know the 
hardware topology from Linux in same simple way. And it seems it is a reasonable
requirement to me :-)

> 
> Thanks,
> 
> Will

Thanks
barry
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
