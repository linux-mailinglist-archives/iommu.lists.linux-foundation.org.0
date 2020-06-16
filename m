Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B914F1FABE1
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 11:07:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CD4E89413;
	Tue, 16 Jun 2020 09:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYE7Fqfgpyp6; Tue, 16 Jun 2020 09:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4765893F2;
	Tue, 16 Jun 2020 09:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84E7FC016E;
	Tue, 16 Jun 2020 09:07:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 538E4C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 09:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 484E987591
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 09:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwXJYI3Uoder for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 09:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D747D87589
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 09:07:39 +0000 (UTC)
IronPort-SDR: 48yWQRIlnJHUyFp8WeGoYcj3Q21FS+gDi58J2fSDgY+ELdoD03bVljCWg7b0Svo4m1U0Ww/XGl
 6WNTwNmxmM0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 02:07:38 -0700
IronPort-SDR: TQ1XfkGEeoeoG4hDHkgXQaJRHgshwos39SDaXXPyBzCZNxU7kRC1aXIkgF7e87jzOUFOtjhI6l
 rgry9sdwiD5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="382814431"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 16 Jun 2020 02:07:31 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 16 Jun 2020 12:07:30 +0300
Date: Tue, 16 Jun 2020 12:07:30 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH 2/4] pci: set "untrusted" flag for truly external devices
 only
Message-ID: <20200616090730.GF2795@lahna.fi.intel.com>
References: <20200616011742.138975-1-rajatja@google.com>
 <20200616011742.138975-2-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616011742.138975-2-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Todd Broch <tbroch@google.com>, linux-pci@vger.kernel.org,
 lalithambika.krishnakumar@intel.com, Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 linux-acpi@vger.kernel.org, Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Bernie Keany <bernie.keany@intel.com>,
 Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, oohall@gmail.com,
 Benson Leung <bleung@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Alex Levin <levinale@google.com>
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

On Mon, Jun 15, 2020 at 06:17:40PM -0700, Rajat Jain wrote:
> The "ExternalFacing" devices (root ports) are still internal devices
> that sit on the internal system fabric and thus trusted. Currently they
> were being marked untrusted - likely as an unintended border case.

It was actually intentional :) At the time this was added we did not see
benefits from doing this and even with this you actually are going to
still miss things like a TBT chip that is soldered on the motherboard, I
guess that can be though as an internal device as well.

No objections to this patch, though.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
