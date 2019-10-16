Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E75D89F4
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 09:39:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EC32A7A;
	Wed, 16 Oct 2019 07:39:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B11A5941
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5799F6C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:39:39 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 41so19302098oti.12
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 00:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u6h+RkRVUsq/dtMElBXWonVtZrcWWoHniyxcDvzJ7QM=;
	b=BANIDKuZISOJc7dwMgMUZjJcnr0B5AfYuJ7ZijRI1Co6pwN2l7c7x7pbjiZ6lR2bOb
	PWfIp2zwPD3GMNhfpLud1r//o0rpFgj5LflCw2Ui7BXSO/S3fO/z85g/dRGm9hVvzuai
	4Yy5jTdrqqOR9WnJL3P1fxfB8cZVRbmLtw7yC29YcCrhI6jmIMdq31cCitGLXRHqBys1
	dFJSW0ReWXIsqJ8zeKicnll3KyIBdaQkN0k/+6V4NpuERKEOvsT1iOKiJKQmuh+vC+xT
	5yKceejtWMVYIvSqDEthxONrS/848jstFMWoc/CjBsv5Hnx8ilHkvDoYUTvPt3z74cg6
	fXXw==
X-Gm-Message-State: APjAAAXOKrlZbcJxlle32JAbGOHUhpMTDz0i+lUdIwJilnhw9Ax2P1k9
	M+RVfGZ8oN4BD1u8NgjUM1WWlJNIxv+fHnLd/pLO5qN5
X-Google-Smtp-Source: APXvYqzyYxruToiWl1hUzjFEkCACi8HQQ70s5TB1u6heEcbPUmwmq3Qet/gWJ2Bnv463hqrcY06RWGvAL+nZdxWbO7Q=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr15685380otj.107.1571211578558;
	Wed, 16 Oct 2019 00:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1571137920-15314-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571137920-15314-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Oct 2019 09:39:27 +0200
Message-ID: <CAMuHMdXF_cY0OM64+NcqLJaYwqOJfk2wz5FwLW7GhMm72ZcOiQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB"
	registers
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, Oct 15, 2019 at 2:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> This patch adds helper functions ipmmu_utlb_reg() and
> ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
