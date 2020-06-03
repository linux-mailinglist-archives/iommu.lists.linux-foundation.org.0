Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151A1EC8D3
	for <lists.iommu@lfdr.de>; Wed,  3 Jun 2020 07:30:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCD148631D;
	Wed,  3 Jun 2020 05:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rw+W0Y8DyFiB; Wed,  3 Jun 2020 05:30:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBA7A8660D;
	Wed,  3 Jun 2020 05:30:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D28D4C016E;
	Wed,  3 Jun 2020 05:30:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC2BC016E
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 05:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9BDAB87EA4
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 05:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbRTLAdOrrmX for <iommu@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 05:30:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2102D87E0A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 05:30:14 +0000 (UTC)
IronPort-SDR: uuyybMWSM7iaFt4RB/tcUhtSzWz1jVjT5tnLLkYz/39nrAcecGgcvYShKt3XTKQWKXTAiakg5v
 SOhoG37ohilw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 22:30:13 -0700
IronPort-SDR: 0cWYtPZtBHwgk1szY2u3scGNdBUAiggIUcHJKs3Tae7sEL3mHr97A1ldF8/iuLLoTu0Z8e7ecn
 HOqM/ahP/yKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="377986062"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 02 Jun 2020 22:30:08 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Jun 2020 08:30:08 +0300
Date: Wed, 3 Jun 2020 08:30:08 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v3] iommu/vt-d: Don't apply gfx quirks to untrusted devices
Message-ID: <20200603053008.GR247495@lahna.fi.intel.com>
References: <20200602232602.156049-1-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602232602.156049-1-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: tbroch@google.com, pmalani@google.com, Ashok Raj <ashok.raj@intel.com>,
 rajatxjain@gmail.com, zsm@google.com, linux-kernel@vger.kernel.org,
 lalithambika.krishnakumar@intel.com, iommu@lists.linux-foundation.org,
 mnissler@google.com, bleung@google.com, levinale@google.com,
 David Woodhouse <dwmw2@infradead.org>
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

On Tue, Jun 02, 2020 at 04:26:02PM -0700, Rajat Jain wrote:
> +static bool risky_device(struct pci_dev *pdev)
> +{
> +	if (pdev->untrusted) {
> +		pci_warn(pdev,
> +			 "Skipping IOMMU quirk for dev (%04X:%04X) on untrusted"
> +			 " PCI link. Please check with your BIOS/Platform"
> +			 " vendor about this\n", pdev->vendor, pdev->device);

You should not break user visible strings like this. It makes grepping
for them harder (see also CodingStyle). You can write it like this instead:

	pci_info(pdev, "Skipping IOMMU quirk for dev (%04X:%04X) on untrusted PCI link\n",
		 pdev->vendor, pdev->device);
	pci_info(pdev, "Please check with your BIOS/Platform vendor about this\n");

Also I guess pci_info() might be better here after all. Your call :)

Rest of the patch looks good to me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
