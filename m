Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219017B958
	for <lists.iommu@lfdr.de>; Fri,  6 Mar 2020 10:33:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7624204DB;
	Fri,  6 Mar 2020 09:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpZYuUZ+BV-g; Fri,  6 Mar 2020 09:33:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 64AAA20117;
	Fri,  6 Mar 2020 09:33:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53AE0C013E;
	Fri,  6 Mar 2020 09:33:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DB3FC013E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 09:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 026C287E9C
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 09:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-gydfR4Dehc for <iommu@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 09:33:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 65B9887E76
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 09:33:28 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BD4911C0AA932FE648A1;
 Fri,  6 Mar 2020 17:33:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.223.23) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Mar 2020
 17:33:12 +0800
Subject: Re: [PATCH 00/10] PCI/ATS: Device-tree support and other improvements
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, <bhelgaas@google.com>,
 <will@kernel.org>, <robh+dt@kernel.org>, <lorenzo.pieralisi@arm.com>,
 <joro@8bytes.org>, <baolu.lu@linux.intel.com>, <linux-doc@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <b898317c-c534-aad8-5b0d-45723e0b8e89@huawei.com>
Date: Fri, 6 Mar 2020 17:32:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.177.223.23]
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, frowand.list@gmail.com, corbet@lwn.net,
 liviu.dudau@arm.com, rjw@rjwysocki.net, Linuxarm <linuxarm@huawei.com>,
 sudeep.holla@arm.com, amurray@thegoodpenguin.co.uk, robin.murphy@arm.com,
 dwmw2@infradead.org, lenb@kernel.org
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

On 2020/2/14 0:50, Jean-Philippe Brucker wrote:
> Enable ATS on device-tree based systems, and factor the common ATS
> enablement checks into pci_enable_ats().
> 
> ATS support in PCIe endpoints is discovered through the ATS capability,
> but there is no common method for discovering whether the host bridge
> supports ATS. Each vendor provides their own ACPI method:
> * DMAR (Intel) reports ATS support per domain or per root port.
> * IVRS (AMD) reports negative ATS support for a range of devices.
> * IORT (ARM) reports ATS support for a root complex.

Tested this patch set against 5.6-rc2 on a Kunpeng920 ARM server,
I just confirmed that this patch set didn't break anything in
my box with ACPI booting, PCI devices work as expected, FWIW,

Tested-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
