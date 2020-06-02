Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B611EB8F4
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 11:57:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39D3E88312;
	Tue,  2 Jun 2020 09:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSwSXgii2FB0; Tue,  2 Jun 2020 09:57:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3D5B88306;
	Tue,  2 Jun 2020 09:57:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C88EC016E;
	Tue,  2 Jun 2020 09:57:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BEBDC016E
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47FBA85D3D
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ROHroIw6Owi for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 09:50:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B29B86276
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:50:09 +0000 (UTC)
IronPort-SDR: JlTp8XgUgwgw8p/5xDLLIAbMGwg/urf7EWZIxNFMOfroh3lMuv5yvNPgzgSwdYAfZNRgBTizJi
 WZEPq7e3913w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 02:50:08 -0700
IronPort-SDR: 1wM2/0IT4DznM5UA7kHHznMwfEwhMqcBUpu+200PCHFFobW4oeFyXE/fxj0z5vp529c0n51qSi
 AmqbmEmkl6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,463,1583222400"; d="scan'208";a="377701826"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 02 Jun 2020 02:50:03 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 02 Jun 2020 12:50:03 +0300
Date: Tue, 2 Jun 2020 12:50:03 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] iommu/vt-d: Don't apply gfx quirks to untrusted devices
Message-ID: <20200602095003.GI247495@lahna.fi.intel.com>
References: <20200602054517.191244-1-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602054517.191244-1-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:57:14 +0000
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

On Mon, Jun 01, 2020 at 10:45:17PM -0700, Rajat Jain wrote:
> Currently, an external malicious PCI device can masquerade the VID:PID
> of faulty gfx devices, and thus apply iommu quirks to effectively
> disable the IOMMU restrictions for itself.
> 
> Thus we need to ensure that the device we are applying quirks to, is
> indeed an internal trusted device.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  drivers/iommu/intel-iommu.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index ef0a5246700e5..f2a480168a02f 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -6214,6 +6214,11 @@ const struct iommu_ops intel_iommu_ops = {
>  
>  static void quirk_iommu_igfx(struct pci_dev *dev)
>  {
> +	if (dev->untrusted) {
> +		pci_warn(dev, "skipping iommu quirk for untrusted gfx dev\n");

I think you should be consistent with other messages. For example iommu
should be spelled IOMMU as done below.

Also this is visible to users so maybe put bit more information there:

  pci_warn(dev, "Will not apply IOMMU quirk for untrusted graphics device\n");

Ditto for all the other places. Also is "untrusted" good word here? If
an ordinary user sees this will it trigger some sort of panic reaction.
Perhaps we should call it "potentially untrusted" or something like
that?

> +		return;
> +	}
> +
>  	pci_info(dev, "Disabling IOMMU for graphics on this chipset\n");
>  	dmar_map_gfx = 0;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
