Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C203F9A1D
	for <lists.iommu@lfdr.de>; Fri, 27 Aug 2021 15:30:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7EC40189;
	Fri, 27 Aug 2021 13:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfyfj16gbKBj; Fri, 27 Aug 2021 13:30:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3CFFB40283;
	Fri, 27 Aug 2021 13:30:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE28C000E;
	Fri, 27 Aug 2021 13:30:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5230CC000E
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41ACB83330
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ziepe.ca
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALb9KR1mZDO0 for <iommu@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 13:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DCFD83332
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 13:30:13 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id l4so3911845qvl.12
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9hYvHFGz/V7D23iiTPTOyxcZm7pKUcDRg4kDhPveMaM=;
 b=RWh3PyaLn9DmYFUvWMAb0sMx7t5tv8neu2ri9D8mJwjUh0f9X4mBOK1mWoSNx+Xk7Q
 UXygO2RUgsM9ytHw0J7ZnZXf2r3UP4CjRgIHdV2VX/t+bSo6kamNRr5JE5kNDltUDNzn
 WQgF2d+L0cB45zjDOFEV11+rf/T7+4zgjItd3QTdskgaWTbyVTVvxaCh837ERZ9KLWWx
 6TAPmCSOQ6wzP73NwO/nlGoXEsh1OPCVaa9p1VGWwEwyT1w8H6tsGbZ3QUOGbnXVXzFe
 STjKaFkm5jV0/3qBR3EBlTYcZnURiYHMgxlqQvSKJJpwNGztKUytgfSlnkTIo0X69uPm
 QMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9hYvHFGz/V7D23iiTPTOyxcZm7pKUcDRg4kDhPveMaM=;
 b=emASBqjHYkZgUGpxbrUTlJiaruODMBVB0OT9/gei4PtZPG3UXxD5bVDyFTQbqJtywn
 7iMgXJVSZLG4WSgpSF26fslIhCa0boe+nJ/iSFfcuMq5hhWZee4mZbSX4ve2TTLTJkZR
 LR4nRYOhD/ebqUKbFENwqL08t7+Di62q3TAeapbudYNQE64Whs+Vz6jkQFShd7FHul7J
 9Ykir50/FH+N+wpsc3iB55S8zTH5mXqnMB4CsRnTO+U+RBF8XgOpg4GsdaWoibTR8S8b
 7Pb478ymNPWwA7+1tknKzeeIorcTTpISMQkwmBkXeGgVQotfwGb7eIm4PjgAwULVVOuF
 qQ+w==
X-Gm-Message-State: AOAM532Jpg83H+b9GezFn9p2+S1MfhS9UXT+P07p3PRcauRLQ8mMVhOp
 sYXKjMn8k0x5QLMFvWts8vd9PA==
X-Google-Smtp-Source: ABdhPJy6C+imSV9BJygXNb/9syIQPPZVv3Rskg/63cA9hZ4wB9eYt23ZeyxBKJWpGeqjdoeuyRZmDA==
X-Received: by 2002:ad4:5aee:: with SMTP id c14mr7922342qvh.19.1630071012375; 
 Fri, 27 Aug 2021 06:30:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id q184sm4865997qkd.35.2021.08.27.06.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:30:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mJbvv-005gvU-41; Fri, 27 Aug 2021 10:30:11 -0300
Date: Fri, 27 Aug 2021 10:30:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [PATCH v4 14/14] tpm: Allow locality 2 to be set when
 initializing the TPM for Secure Launch
Message-ID: <20210827133011.GJ1200268@ziepe.ca>
References: <1630070917-9896-1-git-send-email-ross.philipson@oracle.com>
 <1630070917-9896-15-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630070917-9896-15-git-send-email-ross.philipson@oracle.com>
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

On Fri, Aug 27, 2021 at 09:28:37AM -0400, Ross Philipson wrote:
> The Secure Launch MLE environment uses PCRs that are only accessible from
> the DRTM locality 2. By default the TPM drivers always initialize the
> locality to 0. When a Secure Launch is in progress, initialize the
> locality to 2.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  drivers/char/tpm/tpm-chip.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Global state like this seems quite dangerous, shouldn't the locality
be selected based on the PCR being accessed, or passed down from
higher up in the call chain?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
