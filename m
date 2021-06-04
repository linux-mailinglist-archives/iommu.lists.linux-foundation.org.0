Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 823DC39BBB3
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:22:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B5C843D9;
	Fri,  4 Jun 2021 15:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLSwhTvFF5Tf; Fri,  4 Jun 2021 15:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C5A843D4;
	Fri,  4 Jun 2021 15:22:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8ED8C001C;
	Fri,  4 Jun 2021 15:22:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE0CC000D
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2874F415C0
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuBqWAF0tInh for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:22:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 727744068A
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:22:10 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 983AC3A9; Fri,  4 Jun 2021 17:22:08 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:22:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 2/6] ACPI: Move IOMMU setup code out of IORT
Message-ID: <YLpFHwGPuWsB3AgV@8bytes.org>
References: <20210602154444.1077006-3-jean-philippe@linaro.org>
 <202106030417.97asL7dA-lkp@intel.com> <YLiELyo+KLuYqA24@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLiELyo+KLuYqA24@myrica>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>, mst@redhat.com,
 catalin.marinas@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 clang-built-linux@googlegroups.com, iommu@lists.linux-foundation.org,
 will@kernel.org, dwmw2@infradead.org, lenb@kernel.org
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

On Thu, Jun 03, 2021 at 09:26:39AM +0200, Jean-Philippe Brucker wrote:
> These are only defined when CONFIG_IOMMU_API is set. IORT uses them inside
> an #ifdef, I can do the same. Maybe moving these two functions to a new
> drivers/acpi/iommu.c would be nicer, though.

Not sure what the ACPI maintainers and reviewers prefer, but I would
just #ifdef the functions and provide stubs in the #else path if
necessary.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
