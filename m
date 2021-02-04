Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9130C028
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 14:51:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 66AFA20492;
	Tue,  2 Feb 2021 13:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kc3teXaJlDJw; Tue,  2 Feb 2021 13:51:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D42F02046B;
	Tue,  2 Feb 2021 13:51:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B131DC1DA8;
	Tue,  2 Feb 2021 13:51:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41298C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3823886180
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAT13qSR8IQt for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 13:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 85C768613C
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:51:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B01A03D4; Tue,  2 Feb 2021 14:51:31 +0100 (CET)
Date: Tue, 2 Feb 2021 14:51:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/3] iommu/vt-d: Add new enum value and structure for SATC
Message-ID: <20210202135130.GV32671@8bytes.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202044057.615277-2-baolu.lu@linux.intel.com>
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

Hi Baolu,

On Tue, Feb 02, 2021 at 12:40:55PM +0800, Lu Baolu wrote:
> @@ -514,7 +514,8 @@ enum acpi_dmar_type {
>  	ACPI_DMAR_TYPE_ROOT_ATS = 2,
>  	ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,
>  	ACPI_DMAR_TYPE_NAMESPACE = 4,
> -	ACPI_DMAR_TYPE_RESERVED = 5	/* 5 and greater are reserved */
> +	ACPI_DMAR_TYPE_SATC = 5,
> +	ACPI_DMAR_TYPE_RESERVED = 6	/* 5 and greater are reserved */

Nit: The comment needs to be updated too.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
