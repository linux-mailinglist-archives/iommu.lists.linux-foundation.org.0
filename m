Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6231EC364
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 22:05:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CD55522817;
	Tue,  2 Jun 2020 20:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB7B5MBMn+Ci; Tue,  2 Jun 2020 20:05:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E51E2227CE;
	Tue,  2 Jun 2020 20:05:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C78A5C0893;
	Tue,  2 Jun 2020 20:05:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 680D9C016E
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4DCD1854E7
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywqGe_7L5PV9 for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 20:05:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D4C3D851D6
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 20:05:36 +0000 (UTC)
IronPort-SDR: 12Hlt8RJqtXvJ8J0+n5sgc8jGqNGbZBBI+xtvdFMLe9D9Sp4lMSYpT8o7rsBXZGCC9y7X7jyAb
 DV7/IvJZuw8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 13:05:36 -0700
IronPort-SDR: j+uz9EZpXx3Aq/tV6t8Xv3otI9hzrOUqAVrLgz40kePv1smgfrIh2DXHXSvd6Y1uDTPIN4kz1l
 ro0C9uuMJkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="257227532"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2020 13:05:35 -0700
Date: Tue, 2 Jun 2020 13:05:35 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2] iommu/vt-d: Don't apply gfx quirks to untrusted devices
Message-ID: <20200602200534.GA17363@otc-nc-03>
References: <20200602184133.75525-1-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602184133.75525-1-rajatja@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: tbroch@google.com, rajatxjain@gmail.com, pmalani@google.com, zsm@google.com,
 linux-kernel@vger.kernel.org, lalithambika.krishnakumar@intel.com,
 iommu@lists.linux-foundation.org, mnissler@google.com,
 Ashok Raj <ashok.raj@intel.com>, bleung@google.com, levinale@google.com,
 David Woodhouse <dwmw2@infradead.org>,
 Mika Westerberg <mika.westerberg@intel.com>
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

Hi Rajat

On Tue, Jun 02, 2020 at 11:41:33AM -0700, Rajat Jain wrote:
> Currently, an external malicious PCI device can masquerade the VID:PID
> of faulty gfx devices, and thus apply iommu quirks to effectively
> disable the IOMMU restrictions for itself.
> 
> Thus we need to ensure that the device we are applying quirks to, is
> indeed an internal trusted device.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
> V2: - Change the warning print strings.
>     - Add Lu Baolu's acknowledgement.
> 
>  drivers/iommu/intel-iommu.c | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index ef0a5246700e5..fdfbea4ff8cb3 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -6214,6 +6214,13 @@ const struct iommu_ops intel_iommu_ops = {
>  
>  static void quirk_iommu_igfx(struct pci_dev *dev)
>  {
> +	if (dev->untrusted) {
> +		pci_warn(dev,
> +			 "Skipping IOMMU quirk %s() for potentially untrusted device\n",
> +			 __func__);
> +		return;
> +	}
> +

This check and code seems to be happening several times. Maybe add a simple
function to do the test and use in all places?

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
