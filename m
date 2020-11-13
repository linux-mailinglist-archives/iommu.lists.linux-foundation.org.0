Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC32B1362
	for <lists.iommu@lfdr.de>; Fri, 13 Nov 2020 01:41:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 33614872CA;
	Fri, 13 Nov 2020 00:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DqF0qqxyTXN; Fri, 13 Nov 2020 00:41:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83ACA872C6;
	Fri, 13 Nov 2020 00:41:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A2DC0FAA;
	Fri, 13 Nov 2020 00:41:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAF82C0FAA
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 00:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94C9F86E31
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 00:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfwvpNsApu3j for <iommu@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 00:41:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D287186E2C
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 00:41:26 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXKQX5jPQzLmVr;
 Fri, 13 Nov 2020 08:41:08 +0800 (CST)
Received: from [10.174.179.182] (10.174.179.182) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 08:41:14 +0800
Subject: Re: [PATCH v8 5/9] ACPI/IORT: Enable stall support for platform
 devices
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, <joro@8bytes.org>,
 <will@kernel.org>, <lorenzo.pieralisi@arm.com>, <robh+dt@kernel.org>
References: <20201112125519.3987595-1-jean-philippe@linaro.org>
 <20201112125519.3987595-6-jean-philippe@linaro.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <f266330a-4c06-d33d-96a1-d703a6b7e76b@huawei.com>
Date: Fri, 13 Nov 2020 08:41:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201112125519.3987595-6-jean-philippe@linaro.org>
Content-Language: en-GB
X-Originating-IP: [10.174.179.182]
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, sudeep.holla@arm.com, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, bhelgaas@google.com, zhangfei.gao@linaro.org,
 vivek.gautam@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On 2020/11/12 20:55, Jean-Philippe Brucker wrote:
> Copy the "Stall supported" bit, that tells whether a platform device
> supports stall, into the fwspec struct.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Hanjun Guo <guohanjun@huawei.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
