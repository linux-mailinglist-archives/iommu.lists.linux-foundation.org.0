Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2193B0BCA
	for <lists.iommu@lfdr.de>; Tue, 22 Jun 2021 19:46:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA28040311;
	Tue, 22 Jun 2021 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uaCLJqb3Gx0; Tue, 22 Jun 2021 17:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 544CA4032C;
	Tue, 22 Jun 2021 17:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EFB6C000E;
	Tue, 22 Jun 2021 17:46:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51231C000E
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 17:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA3060861
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 17:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ihq2ozPUpXd for <iommu@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 17:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB44F60860
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 17:46:23 +0000 (UTC)
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G8YTv621Sz6H7Gp;
 Wed, 23 Jun 2021 01:36:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 22 Jun 2021 19:46:19 +0200
Received: from [10.47.89.126] (10.47.89.126) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 22 Jun
 2021 18:46:18 +0100
Subject: Re: [PATCH 0/6] iommu: Enable devices to request non-strict DMA,
 starting with QCom SD/MMC
To: Douglas Anderson <dianders@chromium.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <rafael.j.wysocki@intel.com>, <will@kernel.org>,
 <robin.murphy@arm.com>, <joro@8bytes.org>, <bjorn.andersson@linaro.org>,
 <ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <bhelgaas@google.com>
References: <20210621235248.2521620-1-dianders@chromium.org>
From: John Garry <john.garry@huawei.com>
Message-ID: <f3078ff2-97a6-6029-b584-1589ed184579@huawei.com>
Date: Tue, 22 Jun 2021 18:39:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210621235248.2521620-1-dianders@chromium.org>
Content-Language: en-US
X-Originating-IP: [10.47.89.126]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: robdclark@chromium.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mmc@vger.kernel.org,
 quic_c_gdjako@quicinc.com, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org,
 joel@joelfernandes.org, Dan Williams <dan.j.williams@intel.com>,
 rajatja@google.com, sonnyrao@chromium.org, vbadigan@codeaurora.org
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

On 22/06/2021 00:52, Douglas Anderson wrote:
> 
> This patch attempts to put forward a proposal for enabling non-strict
> DMA on a device-by-device basis. The patch series requests non-strict
> DMA for the Qualcomm SDHCI controller as a first device to enable,
> getting a nice bump in performance with what's believed to be a very
> small drop in security / safety (see the patch for the full argument).
> 
> As part of this patch series I am end up slightly cleaning up some of
> the interactions between the PCI subsystem and the IOMMU subsystem but
> I don't go all the way to fully remove all the tentacles. Specifically
> this patch series only concerns itself with a single aspect: strict
> vs. non-strict mode for the IOMMU. I'm hoping that this will be easier
> to talk about / reason about for more subsystems compared to overall
> deciding what it means for a device to be "external" or "untrusted".
> 
> If something like this patch series ends up being landable, it will
> undoubtedly need coordination between many maintainers to land. I
> believe it's fully bisectable but later patches in the series
> definitely depend on earlier ones. Sorry for the long CC list. :(
> 

JFYI, In case to missed it, and I know it's not the same thing as you 
want, above, but the following series will allow you to build the kernel 
to default to lazy mode:

https://lore.kernel.org/linux-iommu/1624016058-189713-1-git-send-email-john.garry@huawei.com/T/#m21bc07b9353b3ba85f2a40557645c2bcc13cbb3e

So iommu.strict=0 would be no longer always required for arm64.

Thanks,
John


> 
> Douglas Anderson (6):
>    drivers: base: Add the concept of "pre_probe" to drivers
>    drivers: base: Add bits to struct device to control iommu strictness
>    PCI: Indicate that we want to force strict DMA for untrusted devices
>    iommu: Combine device strictness requests with the global default
>    iommu: Stop reaching into PCIe devices to decide strict vs. non-strict
>    mmc: sdhci-msm: Request non-strict IOMMU mode
> 
>   drivers/base/dd.c             | 10 +++++--
>   drivers/iommu/dma-iommu.c     |  2 +-
>   drivers/iommu/iommu.c         | 56 +++++++++++++++++++++++++++--------
>   drivers/mmc/host/sdhci-msm.c  |  8 +++++
>   drivers/pci/probe.c           |  4 ++-
>   include/linux/device.h        | 11 +++++++
>   include/linux/device/driver.h |  9 ++++++
>   include/linux/iommu.h         |  2 ++
>   8 files changed, 85 insertions(+), 17 deletions(-)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
