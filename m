Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A091EB4AB
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 06:43:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9AF6D87BC8;
	Tue,  2 Jun 2020 04:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNPlRvE1Y1Lv; Tue,  2 Jun 2020 04:42:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A713D87BCA;
	Tue,  2 Jun 2020 04:42:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8980FC0176;
	Tue,  2 Jun 2020 04:42:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4BD8C0176
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9AF0685E0B
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZ6kHNsD0txQ for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:42:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 105D285E06
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:42:54 +0000 (UTC)
Received: from dggemi406-hub.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id B531CB564B3EBAAFC3AC;
 Tue,  2 Jun 2020 12:42:50 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.10]) by
 dggemi406-hub.china.huawei.com ([10.3.17.144]) with mapi id 14.03.0487.000;
 Tue, 2 Jun 2020 12:42:43 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] driver core: platform: expose numa_node to users in sysfs
Thread-Topic: [PATCH] driver core: platform: expose numa_node to users in sysfs
Thread-Index: AQHWOIpUwdvGGcJ/+UCxidEm0PhHvqjEM/4AgACJWmA=
Date: Tue, 2 Jun 2020 04:42:42 +0000
Message-ID: <B926444035E5E2439431908E3842AFD24D8D1E@DGGEMI525-MBS.china.huawei.com>
References: <20200602030139.73012-1-song.bao.hua@hisilicon.com>
 <20200602042340.GA2130884@kroah.com>
In-Reply-To: <20200602042340.GA2130884@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.56]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "rafael@kernel.org" <rafael@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Robin Murphy <robin.murphy@arm.com>,
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
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Tuesday, June 2, 2020 4:24 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: rafael@kernel.org; iommu@lists.linux-foundation.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Linuxarm
> <linuxarm@huawei.com>; Zengtao (B) <prime.zeng@hisilicon.com>; Robin
> Murphy <robin.murphy@arm.com>
> Subject: Re: [PATCH] driver core: platform: expose numa_node to users in sysfs
> 
> On Tue, Jun 02, 2020 at 03:01:39PM +1200, Barry Song wrote:
> > For some platform devices like iommu, particually ARM smmu, users may
> > care about the numa locality. for example, if threads and drivers run
> > near iommu, they may get much better performance on dma_unmap_sg.
> > For other platform devices, users may still want to know the hardware
> > topology.
> >
> > Cc: Prime Zeng <prime.zeng@hisilicon.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> > ---
> >  drivers/base/platform.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index b27d0f6c18c9..7794b9a38d82 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -1062,13 +1062,37 @@ static ssize_t driver_override_show(struct
> device *dev,
> >  }
> >  static DEVICE_ATTR_RW(driver_override);
> >
> > +static ssize_t numa_node_show(struct device *dev,
> > +		struct device_attribute *attr, char *buf)
> > +{
> > +	return sprintf(buf, "%d\n", dev_to_node(dev));
> > +}
> > +static DEVICE_ATTR_RO(numa_node);
> > +
> > +static umode_t platform_dev_attrs_visible(struct kobject *kobj, struct
> attribute *a,
> > +		int n)
> > +{
> > +	struct device *dev = container_of(kobj, typeof(*dev), kobj);
> > +
> > +	if (a == &dev_attr_numa_node.attr &&
> > +			dev_to_node(dev) == NUMA_NO_NODE)
> > +		return 0;
> > +
> > +	return a->mode;
> > +}
> >
> >  static struct attribute *platform_dev_attrs[] = {
> >  	&dev_attr_modalias.attr,
> > +	&dev_attr_numa_node.attr,
> >  	&dev_attr_driver_override.attr,
> >  	NULL,
> >  };
> > -ATTRIBUTE_GROUPS(platform_dev);
> > +
> > +static struct attribute_group platform_dev_group = {
> > +	.attrs = platform_dev_attrs,
> > +	.is_visible = platform_dev_attrs_visible,
> > +};
> > +__ATTRIBUTE_GROUPS(platform_dev);
> >
> >  static int platform_uevent(struct device *dev, struct kobj_uevent_env *env)
> >  {
> 
> Platform devices are NUMA?  That's crazy, and feels like a total abuse
> of platform devices and drivers that really should belong on a "real"
> bus.

I am not sure if it is an abuse of platform device. But smmu is a platform device,
drivers/iommu/arm-smmu-v3.c is a platform driver.
In a typical ARM server, there are maybe multiple SMMU devices which can support
IO virtual address and page tables for other devices on PCI-like busses.
Each different SMMU device might be close to different NUMA node. There is
really a hardware topology.

If you have multiple CPU packages in a NUMA server, some platform devices might
Belong to CPU0, some other might belong to CPU1.

-barry

> 
> What drivers in the kernel today have this issue?
> 
> thanks,
> 
> greg k-h


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
