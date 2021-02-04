Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845230C02C
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 14:53:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB1C985B2F;
	Tue,  2 Feb 2021 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWhrFnNWH4RT; Tue,  2 Feb 2021 13:53:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67E9885A82;
	Tue,  2 Feb 2021 13:53:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5223EC013A;
	Tue,  2 Feb 2021 13:53:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B807C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE5FD8678E
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbhDBlBRlaHy for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 13:53:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7DD3986180
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:53:08 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2451B3E6; Tue,  2 Feb 2021 14:53:07 +0100 (CET)
Date: Tue, 2 Feb 2021 14:53:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 2/3] iommu/vt-d: Parse SATC reporting structure
Message-ID: <20210202135305.GW32671@8bytes.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202044057.615277-3-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Ashok Raj <ashok.raj@intel.com>,
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

On Tue, Feb 02, 2021 at 12:40:56PM +0800, Lu Baolu wrote:
> +	case ACPI_DMAR_TYPE_SATC:
> +		satc = container_of(header, struct acpi_dmar_satc, header);
> +		pr_info("SATC flags: 0x%x\n", satc->flags);
> +		break;

Did the pr_info() slip through or is there a real purpose for having
this information in the kernel log?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
