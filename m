Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C16FC1D5773
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 19:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 502C688E51;
	Fri, 15 May 2020 17:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c2VzE8Zfmfr; Fri, 15 May 2020 17:19:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EB1088E58;
	Fri, 15 May 2020 17:19:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75FFCC016F;
	Fri, 15 May 2020 17:19:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50DA4C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C8B989B5F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ap8Kifpapzei for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C48A089B4C
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:19:49 +0000 (UTC)
IronPort-SDR: 75HL87wFeT6Bib2Zj5tIMIS26wC3fOfM5F1VZG/rqaMCUSn5+G2AFFALeBbSK3Vrb+4WVNsz0Z
 RJ/Az/ChmGvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 10:19:49 -0700
IronPort-SDR: eZEoXLPhr5Cv4k9IWYM8gN4137BapxcAi4vssr/dR789L2+dXVQmk1JPIhPZN2nFL5mp2ML7hg
 BUSPg6BHnf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="281283658"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 10:19:49 -0700
Date: Fri, 15 May 2020 10:19:49 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 0/4] PCI, iommu: Factor 'untrusted' check for ATS
 enablement
Message-ID: <20200515171948.GC75440@otc-nc-03>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
 <20200515154351.GA6546@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515154351.GA6546@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 alex.williamson@redhat.com, iommu@lists.linux-foundation.org,
 bhelgaas@google.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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

Hi Christoph

On Fri, May 15, 2020 at 08:43:51AM -0700, Christoph Hellwig wrote:
> Can you please lift the untrusted flag into struct device?  It really
> isn't a PCI specific concept, and we should not have code poking into
> pci_dev all over the iommu code.

Just for clarification: All IOMMU's today mostly pertain to only PCI devices
and for devices that aren't PCI like HPET for instance we give a PCI
identifier. Facilities like ATS for instance require the platform to have 
an IOMMU.

what additional problems does moving this to struct device solve?

Cheers,
Ashok

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
