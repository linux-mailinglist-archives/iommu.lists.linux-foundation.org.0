Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBA1AD404
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 03:14:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B2A986B90;
	Fri, 17 Apr 2020 01:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34AQuZXJ9xRc; Fri, 17 Apr 2020 01:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24D4F86A14;
	Fri, 17 Apr 2020 01:14:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4BBC0172;
	Fri, 17 Apr 2020 01:14:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2669FC0172;
 Fri, 17 Apr 2020 01:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21ADB869B6;
 Fri, 17 Apr 2020 01:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSHsnlgeLz97; Fri, 17 Apr 2020 01:14:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 57DB586838;
 Fri, 17 Apr 2020 01:14:33 +0000 (UTC)
IronPort-SDR: vQCByhI+4TpCEpRiiYpgkiXQfhjulNd955xzU4PfJNtIbiEvIwlebpQDCRsarfaNXdn6nHGWDg
 KZdyCTWmBUBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 18:14:32 -0700
IronPort-SDR: sZlVw/7cjCHq0F1EFVv0TW8FklMi9s4vHlLYLRHCGjn12jklAHdg6QlmB19PsSs7PeDXqv0gk5
 UINIzZVqpibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="272262073"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga002.jf.intel.com with ESMTP; 16 Apr 2020 18:14:32 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.143]) with mapi id 14.03.0439.000;
 Thu, 16 Apr 2020 18:14:32 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "joro@8bytes.org" <joro@8bytes.org>, "drake@endlessm.com"
 <drake@endlessm.com>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Thread-Topic: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Thread-Index: AQHWEmDrg4k1XREwpUada/q2n6OD7qh8+KGAgAADDAA=
Date: Fri, 17 Apr 2020 01:14:30 +0000
Message-ID: <aafed865c0254934986528b3ce9c4d34ff2fccad.camel@intel.com>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200417010335.31739-1-drake@endlessm.com>
In-Reply-To: <20200417010335.31739-1-drake@endlessm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.0.232]
Content-ID: <B8851D46B4E5F2468CD8AA858DAC2199@intel.com>
MIME-Version: 1.0
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "kgene@kernel.org" <kgene@kernel.org>, "agross@kernel.org" <agross@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

Hi Daniel,

On Fri, 2020-04-17 at 09:03 +0800, Daniel Drake wrote:
> Hi Joerg,
> 
> > Hi,
> > 
> > here is the second version of this patch-set. The first version with
> > some more introductory text can be found here:
> > 
> > 	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
> 
> Thanks for the continued improvements in this area!
> 
> I may have spotted a problem with setups like VMD.
> 
> The core PCI bus is set up during early boot.
> Then, for the PCI bus, we reach iommu_bus_init() -> bus_iommu_probe().
> In there, we call probe_iommu_group() -> dev_iommu_get() for each PCI
> device, which allocates dev->iommu in each case. So far so good.
> 
> The problem is that this is the last time that we'll call dev_iommu_get().
> If any PCI bus devices get added after this point, they do not get passed
> to dev_iommu_get().
> 
> So when the vmd module gets loaded later, and creates more PCI devices,
> we end up in iommu_bus_notifier() -> iommu_probe_device()
> -> __iommu_probe_device() which does:
> 
> 	dev->iommu->iommu_dev = iommu_dev;
> 
> dev->iommu-> is a NULL dereference because dev_iommu_get() was never
> called for this new device.
> 
> Daniel
> 

I should have CCed you on this, but it should temporarily resolve that
issue:
https://lists.linuxfoundation.org/pipermail/iommu/2020-April/043253.html

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
