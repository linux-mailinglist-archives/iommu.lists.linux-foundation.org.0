Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CAB3E7DD5
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 18:54:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D3960752;
	Tue, 10 Aug 2021 16:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AltwSXCsWi_K; Tue, 10 Aug 2021 16:54:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 35DF960763;
	Tue, 10 Aug 2021 16:54:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64935C0025;
	Tue, 10 Aug 2021 16:54:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3ED3BC000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 16:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20A424014E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 16:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEPCZGVxwxsw for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 16:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3242440146
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 16:21:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E2BF60249;
 Tue, 10 Aug 2021 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628612481;
 bh=yG+iEfJwheMuv6bvfl91XDL3vUDwY4OSRwYIFp8xSnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HsnroX+JuNHAl9TWSqRq8BGHFcXQiwC5YipxrRlYrrltKYC8gLDSKgTPYazEfhEs2
 wzfMH7DkP/DJ0qlK9znkvW/W10sXUwzVYPWEtsCUW6EZg50FVsGAXEGKf0D9bjEe91
 YO7yXwpe7B+QWKO6DSz24r/qGTEYA+Qw/qpIN3Z18XAzuGB9hOU0OkOJgX9faZhbDu
 beyf39ZZzc1hcWF8P7EOilSktkZuKVQJvWvQ0MtSiUU1U9wUBgpMNbJRty/YlEo8Y7
 Y97x78cwuEyURW8GlEG6qDRAi98iMUAKxnKPrYmWzIBRaCxG+q7oHnH0QABfdG5vdy
 gvTGa4CyxIW/A==
Date: Tue, 10 Aug 2021 19:21:19 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [PATCH v3 14/14] tpm: Allow locality 2 to be set when
 initializing the TPM for Secure Launch
Message-ID: <20210810162119.htk366pmacrnzdmh@kernel.org>
References: <1628527136-2478-1-git-send-email-ross.philipson@oracle.com>
 <1628527136-2478-15-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1628527136-2478-15-git-send-email-ross.philipson@oracle.com>
X-Mailman-Approved-At: Tue, 10 Aug 2021 16:54:15 +0000
Cc: linux-doc@vger.kernel.org, dpsmith@apertussolutions.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, kanth.ghatraju@oracle.com, linux-integrity@vger.kernel.org,
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

On Mon, Aug 09, 2021 at 12:38:56PM -0400, Ross Philipson wrote:
> The Secure Launch MLE environment uses PCRs that are only accessible from
> the DRTM locality 2. By default the TPM drivers always initialize the
> locality to 0. When a Secure Launch is in progress, initialize the
> locality to 2.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  drivers/char/tpm/tpm-chip.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index ddaeceb..48b9351 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -23,6 +23,7 @@
>  #include <linux/major.h>
>  #include <linux/tpm_eventlog.h>
>  #include <linux/hw_random.h>
> +#include <linux/slaunch.h>
>  #include "tpm.h"
>  
>  DEFINE_IDR(dev_nums_idr);
> @@ -34,12 +35,20 @@
>  
>  static int tpm_request_locality(struct tpm_chip *chip)
>  {
> -	int rc;
> +	int rc, locality;

        int locality;
        int rc;

>  
>  	if (!chip->ops->request_locality)
>  		return 0;
>  
> -	rc = chip->ops->request_locality(chip, 0);
> +	if (slaunch_get_flags() & SL_FLAG_ACTIVE) {
> +		dev_dbg(&chip->dev, "setting TPM locality to 2 for MLE\n");
> +		locality = 2;
> +	} else {
> +		dev_dbg(&chip->dev, "setting TPM locality to 0\n");
> +		locality = 0;
> +	}

Please, remove dev_dbg()'s.

> +
> +	rc = chip->ops->request_locality(chip, locality);
>  	if (rc < 0)
>  		return rc;
>  
> -- 
> 1.8.3.1

/Jarkko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
