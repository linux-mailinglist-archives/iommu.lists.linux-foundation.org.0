Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EA1D085
	for <lists.iommu@lfdr.de>; Tue, 14 May 2019 22:24:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D9D97D56;
	Tue, 14 May 2019 20:24:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 063B2ACD
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 20:24:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1D65B27B
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 20:24:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x64so367439wmb.5
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=taDjmi1EPzG32HgDSvxyghFDr1RgSGLvyeR6rCNWIQU=;
	b=uQk9msYQUFMEcicw2Jw2KsRY6+ahSF45ALV42fAX/Rytvpj2Xls8fH7EYYgpnlxKhK
	0kwUcDi5XQcPlDmk76bCnrbtqE0iqoUu5YG49Idc8hYpIvZv05swCVlBCGCJT+tVeUro
	B6PdMWIoSbhy672gEpOOWC8ApyigKngMw85z/43NvM7Obpwx2Pup9m/VtYj5qnOmHIir
	qGP/QW5tJu1i3OtcDT41uLFWTo8VsDyi/fiZR6aA+EKervLseAlVAUTMcsWx9GCSPNgN
	x8GPIPHcFR5ILXcOrxVpKkAXtxlk3E5mhtlQvWSTP3kRtBXYQmA83f2AampwiYkfi+m2
	2x3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dsc-ufcg-edu-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=taDjmi1EPzG32HgDSvxyghFDr1RgSGLvyeR6rCNWIQU=;
	b=T6ajZheGeus4fftHJqDGaiixwG9okf9h3cBlxP2eey35FLaeiTeJRvagXKbFVdOKxi
	T/nyEGK6+d5Wn7aVMHCMK2NKR+k4Bew6oFuqn0ZwMQdmDtXXSYP8e4UoXdY+XFWh3md9
	5V2ywpHgsaTjJn8lhDqMboRcZsKPedFIGNi0H+GpqZyRL7kSj7LeYF47jVxjcokZBjvo
	DkETv5YZGW2MBBEv0ysZ89QmvVvtPG+xbBXXGg8dumvkBxmpyHnWSCG6mHuf6t6mMLZb
	fAlnAKB0KDHPBdaWJvB5sLkiQtcXLeZO339bDKZbdQ0J3HKnFOqQ1TJsuz2/JVT1qssx
	Cd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=taDjmi1EPzG32HgDSvxyghFDr1RgSGLvyeR6rCNWIQU=;
	b=CHeys0RvSZJ+peeCcBj5qFzRw4yk3k6ZMu2eNa3OTooyO+pVxpse040Ju4faEA+7Nx
	xzjj4CnNl+2zwhi8cGL9RB3sEHZKMNYUoKWXe7yJvUVE8asrOACmyTyM5326kcMtduIk
	Mvlggbw5WYpQJQHl4QJxJAxt33KQrDKxo5tFgd0hLd+D+9qJsV/Udxqehio0PuZPZoDF
	CAxpzBJNfFZngsQBFkP7aP1/3SIZTkTeuwLMjpWoKeX69Xmn9ICdzLm8SZMbv/QF46aa
	GTNF5AwSev7d3RF/RekUG3DPR565v99UcwpkW53S6E7Q0zaw/RZbjQTj2su10cWDnUKA
	Sezw==
X-Gm-Message-State: APjAAAX+T5FjDt6XgpbB9+lS6thBpOJCdiz9Jg/eP2CzE54Qy86Z3GnR
	ddrg0aDfrtvdtONo9uS3o0UiT0khzlUDTmhyEHIFBSnP
X-Google-Smtp-Source: APXvYqyR7DBxxcG0pIeskQwiMctc4hL+MFF1J3xfAGV9T0B+k2WdtGdeP9CJFxr4v6tOfoqoU3nQKwb1Y4ey08EnwMs=
X-Received: by 2002:a1c:a615:: with SMTP id p21mr16031934wme.40.1557865443455; 
	Tue, 14 May 2019 13:24:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:c503:0:0:0:0:0 with HTTP; Tue, 14 May 2019 13:24:03
	-0700 (PDT)
From: Elmar Melcher <elmar@dsc.ufcg.edu.br>
Date: Tue, 14 May 2019 17:24:03 -0300
X-Google-Sender-Auth: a5fu34l0HXJyNyslNn8nON_SoJk
Message-ID: <CAAZfT+BLUQZocF4O8k0kkSnPnhcuSahqcCsrmgUHWtvc-TH8mA@mail.gmail.com>
Subject: AMD IOMMU BCM 5762 watchdog timeout under heavy traffic
To: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Kernel bisect leads to
[256e4621c21aa1bf704e1a12e643923fdb732d04] iommu/amd: Make use of the
generic IOVA allocator
as cause.
More details: https://bugzilla.kernel.org/show_bug.cgi?id=203607
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
