Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC896278001
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 07:43:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 934538756C;
	Fri, 25 Sep 2020 05:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhJyXP2WoKtM; Fri, 25 Sep 2020 05:43:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E24608756F;
	Fri, 25 Sep 2020 05:43:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE188C0051;
	Fri, 25 Sep 2020 05:43:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0834C0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 05:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2EB086726
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 05:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I84slEIlxvQv for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 05:43:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EF495866B6
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 05:43:18 +0000 (UTC)
IronPort-SDR: aDxFZ3lsBfv+FIEZzkqJe8aV4bjXTIWvDh7HUq2IByPFZYDmmtvOb2G/svKMTkZ05rMPn1G3eb
 aEaJCv+CyHSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="162344162"
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="162344162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 22:43:18 -0700
IronPort-SDR: fd4ITIhTxcQZZfnwoepJLdugVs8r1WtFhOoLToH1S5iY96G0wBOocQXZXY11Ztf63VOZq7kx8f
 zpi90Z27C95w==
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="487319116"
Received: from erybin-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.248])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 22:43:15 -0700
Date: Fri, 25 Sep 2020 08:43:13 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [PATCH 05/13] x86: Add early TPM1.2/TPM2.0 interface support for
 Secure Launch
Message-ID: <20200925054313.GB165011@linux.intel.com>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
 <1600959521-24158-6-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600959521-24158-6-git-send-email-ross.philipson@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-doc@vger.kernel.org, dpsmith@apertussolutions.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, linux-integrity@vger.kernel.org,
 trenchboot-devel@googlegroups.com, tglx@linutronix.de
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

On Thu, Sep 24, 2020 at 10:58:33AM -0400, Ross Philipson wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> This commit introduces an abstraction for TPM1.2 and TPM2.0 devices
> above the TPM hardware interface.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>

This is way, way too PoC. I wonder why there is no RFC tag.

Please also read section 2 of

https://www.kernel.org/doc/html/v5.8/process/submitting-patches.html

You should leverage existing TPM code in a way or another. Refine it so
that it scales for your purpose and then compile it into your thing
(just include the necesary C-files with relative paths).

How it is now is never going to fly.

/Jarkko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
