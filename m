Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61B26F950
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 11:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9D652E1C2;
	Fri, 18 Sep 2020 09:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWggYbKUYy8q; Fri, 18 Sep 2020 09:31:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 85EA622EE6;
	Fri, 18 Sep 2020 09:31:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6398CC0051;
	Fri, 18 Sep 2020 09:31:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2D0C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 09:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7104187657
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 09:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4LiP8fc+VHw for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 09:31:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B9668764D
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 09:31:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 764C2293; Fri, 18 Sep 2020 11:31:19 +0200 (CEST)
Date: Fri, 18 Sep 2020 11:31:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 2/3] iommu: amd: Add support for RMP_PAGE_FAULT and
 RMP_HW_ERR
Message-ID: <20200918093117.GO31590@8bytes.org>
References: <20200916135549.146468-1-suravee.suthikulpanit@amd.com>
 <20200916135549.146468-3-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916135549.146468-3-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Jon.Grimm@amd.com, brijesh.singh@amd.com,
 linux-kernel@vger.kernel.org
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

Hi Suravee,

On Wed, Sep 16, 2020 at 01:55:48PM +0000, Suravee Suthikulpanit wrote:
> +static void amd_iommu_report_rmp_hw_error(volatile u32 *event)
> +{
> +	struct pci_dev *pdev;
> +	struct iommu_dev_data *dev_data = NULL;
> +	int devid     = (event[0] >> EVENT_DEVID_SHIFT) & EVENT_DEVID_MASK;
> +	int vmg_tag   = (event[1]) & 0xFFFF;
> +	int flags     = (event[1] >> EVENT_FLAGS_SHIFT) & EVENT_FLAGS_MASK;
> +	u64 spa       = ((u64)event[3] << 32) | (event[2] & 0xFFFFFFF8);

Please write this as:

	struct iommu_dev_data *dev_data = NULL;
	int devid, vmg_tag, flags;
	struct pci_dev *pdev;
	u64 spa;

	devid   = (event[0] >> EVENT_DEVID_SHIFT) & EVENT_DEVID_MASK;
	vmg_tag = (event[1]) & 0xFFFF;
	flags   = (event[1] >> EVENT_FLAGS_SHIFT) & EVENT_FLAGS_MASK;
	spa     = ((u64)event[3] << 32) | (event[2] & 0xFFFFFFF8);

Same applied the the next function.

> +
> +	pdev = pci_get_domain_bus_and_slot(0, PCI_BUS_NUM(devid),
> +					   devid & 0xff);
> +	if (pdev)
> +		dev_data = dev_iommu_priv_get(&pdev->dev);
> +
> +	if (dev_data && __ratelimit(&dev_data->rs)) {
> +		pci_err(pdev, "Event logged [RMP_HW_ERROR devid=0x%04x, vmg_tag=0x%04x, spa=0x%llx, flags=0x%04x]\n",
> +			devid, vmg_tag, spa, flags);

Printing the devid is not really needed here, no? Same issue in the next
function.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
