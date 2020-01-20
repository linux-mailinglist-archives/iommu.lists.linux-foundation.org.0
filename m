Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C2E1428B5
	for <lists.iommu@lfdr.de>; Mon, 20 Jan 2020 12:02:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 881C32010A;
	Mon, 20 Jan 2020 11:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULbkZMN9Fqud; Mon, 20 Jan 2020 11:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBCD12012D;
	Mon, 20 Jan 2020 11:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C276FC0174;
	Mon, 20 Jan 2020 11:02:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D07BEC0174
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jan 2020 11:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BC9318594B
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jan 2020 11:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N13ixeDMsZEj for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 11:02:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76CA883DD9
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jan 2020 11:02:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBA5630E;
 Mon, 20 Jan 2020 03:02:23 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B50A3F68E;
 Mon, 20 Jan 2020 03:02:22 -0800 (PST)
Date: Mon, 20 Jan 2020 11:02:20 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Christoph Hellwig <hch@lst.de>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 0/7] Clean up VMD DMA Map Ops
Message-ID: <20200120110220.GB17267@e121166-lin.cambridge.arm.com>
References: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
 <20200119222523.GA4890@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200119222523.GA4890@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jon Derrick <jonathan.derrick@intel.com>
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

On Sun, Jan 19, 2020 at 11:25:23PM +0100, Christoph Hellwig wrote:
> This series looks good to me (modulo the one minor nitpick which isn't
> all that important):
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Hi Bjorn,

are you picking this up ? I can merge it too but since it is mostly
x86 changes I reckon you should take it, I acked patch (6) to that
end.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
