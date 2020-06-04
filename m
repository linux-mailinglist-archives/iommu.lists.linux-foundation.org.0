Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 522951EE6EE
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 16:50:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0414B86FC5;
	Thu,  4 Jun 2020 14:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oAT5Bp8MDEd; Thu,  4 Jun 2020 14:50:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67F7686FAF;
	Thu,  4 Jun 2020 14:50:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D333C016E;
	Thu,  4 Jun 2020 14:50:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F17CC016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 14:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B79987D69
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 14:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFrplMBLlia2 for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 14:49:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF1AC87D86
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 14:49:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C5B62B;
 Thu,  4 Jun 2020 07:49:57 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ECCE3F305;
 Thu,  4 Jun 2020 07:49:54 -0700 (PDT)
Date: Thu, 4 Jun 2020 15:49:52 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 07/12] of/device: Add input id to of_dma_configure()
Message-ID: <20200604144952.GB476@e121166-lin.cambridge.arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200521130008.8266-8-lorenzo.pieralisi@arm.com>
 <CAL_JsqJw3wyiUrbd1AekwDc5+uqhHi9BwoB-rYpypUEGNgzCtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJw3wyiUrbd1AekwDc5+uqhHi9BwoB-rYpypUEGNgzCtw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Diana Craciun <diana.craciun@oss.nxp.com>,
 PCI <linux-pci@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, linux-acpi@vger.kernel.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Marc Zyngier <maz@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, May 21, 2020 at 05:02:20PM -0600, Rob Herring wrote:
> On Thu, May 21, 2020 at 7:00 AM Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
> >
> > Devices sitting on proprietary busses have a device ID space that
> > is owned by the respective bus and related firmware bindings. In order
> > to let the generic OF layer handle the input translations to
> > an IOMMU id, for such busses the current of_dma_configure() interface
> > should be extended in order to allow the bus layer to provide the
> > device input id parameter - that is retrieved/assigned in bus
> > specific code and firmware.
> >
> > Augment of_dma_configure() to add an optional input_id parameter,
> > leaving current functionality unchanged.
> >
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > ---
> >  drivers/bus/fsl-mc/fsl-mc-bus.c |  4 ++-
> >  drivers/iommu/of_iommu.c        | 53 +++++++++++++++++++++------------
> >  drivers/of/device.c             |  8 +++--
> >  include/linux/of_device.h       | 16 ++++++++--
> >  include/linux/of_iommu.h        |  6 ++--
> >  5 files changed, 60 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > index 40526da5c6a6..8ead3f0238f2 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > @@ -118,11 +118,13 @@ static int fsl_mc_bus_uevent(struct device *dev, struct kobj_uevent_env *env)
> >  static int fsl_mc_dma_configure(struct device *dev)
> >  {
> >         struct device *dma_dev = dev;
> > +       struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> > +       u32 input_id = mc_dev->icid;
> >
> >         while (dev_is_fsl_mc(dma_dev))
> >                 dma_dev = dma_dev->parent;
> >
> > -       return of_dma_configure(dev, dma_dev->of_node, 0);
> > +       return of_dma_configure_id(dev, dma_dev->of_node, 0, &input_id);
> >  }
> >
> >  static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index ad96b87137d6..4516d5bf6cc9 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -139,25 +139,53 @@ static int of_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
> >         return err;
> >  }
> >
> > -static int of_fsl_mc_iommu_init(struct fsl_mc_device *mc_dev,
> > -                               struct device_node *master_np)
> > +static int of_iommu_configure_dev_id(struct device_node *master_np,
> > +                                    struct device *dev,
> > +                                    const u32 *id)
> 
> Should have read this patch before #6. I guess you could still make
> of_pci_iommu_init() call
> of_iommu_configure_dev_id.

Yes that makes sense, I will update it.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
