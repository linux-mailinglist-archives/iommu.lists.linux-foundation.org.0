Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AAF5ADD
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 23:28:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3E214D38;
	Fri,  8 Nov 2019 22:28:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D7F5DCD2
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8EF0A196
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:28:28 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id q15so1381708ils.8
	for <iommu@lists.linux-foundation.org>;
	Fri, 08 Nov 2019 14:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Mi2iw+Oqn1zkhpAjqTfRgpLqcLPG0FLPCPiiw0Zlvn0=;
	b=QEKU9OofsTu5RHv8oMM+o57xqPPfCClSz3q4/0bRbG2q3Y0GeZR/VrvxdUDaanExrO
	JVapNx+f00ZIehPQgl9WV9AP/vEjuOJsuXyLEc9zh8es0eDh4QyXIkZvclEx5cqvPx9t
	NAyN+UQBr9AAEe8x+UwARZRtmrtAvDmNiIfLFqNGY5W0i0Rvd3Wv4DPnjRJISlkx73go
	CgVRLYePeg6NZD6jbHHFsZpqFiGUMGnzpLdCOTmTNya2xrfqjvHGqPlYPPKcy7KrKzJ5
	7sR9ctijKHYe1zwcq10xOGItZPuvNn1LFN4eZVhyImD/8Q3XuXJZQutMuZotvSPutj9x
	Gq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mi2iw+Oqn1zkhpAjqTfRgpLqcLPG0FLPCPiiw0Zlvn0=;
	b=ZY+Q8kRZetRqR0WK1smFfYRz3dPPAL8rWZClxNEPPc8SwCLE8Y70qh1vZ6MjM2hf4f
	H+feEo6Xo5hIXdO1piRAFzJlo5VCOLJXGwOtkJONYuPP+39nwUS+dmYYzIfGrk+k8QF3
	Q5NntqFIQ89Cf2XTNdLoV/knxIpF0/PlsniQRqdUi+Q+tBoeuNyTr63qCqb7/0k3jFAH
	9bQ+LCh6FMg4lbNYOqW5+6bB3ajRN/ZeR53Tzl5MpbaRs+GiRb1DH1nHJ3LTnAHN4Hh9
	8rZchXmciQtETCTLoW6gejRZuAG2y223n2BBfPSVxSQIGARPgNJG7hIIaYvkZ/wGdKsC
	a46Q==
X-Gm-Message-State: APjAAAWCeZu5KK4EiKwj8wUt3CpLO/rQfub1gU1jT0BMo6cvqb75V1D6
	mI8UrMgYRP/W8i98ywuzAYiWA08qhkkz6L5OpT0=
X-Google-Smtp-Source: APXvYqy1jk4pCHz93zu3QSZ0Nqlqw3CrLIb8MTqy/RMcwECkaHyPGTGHbsM4JebZ1+u6sfnFmz5QQRO5P0RqlIe6sek=
X-Received: by 2002:a92:c888:: with SMTP id w8mr15084644ilo.153.1573252107747; 
	Fri, 08 Nov 2019 14:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20191107205914.10611-1-deepa.kernel@gmail.com>
	<f3d7138b-b254-3c6d-b865-d3b6889aa896@linux.intel.com>
In-Reply-To: <f3d7138b-b254-3c6d-b865-d3b6889aa896@linux.intel.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Fri, 8 Nov 2019 14:28:16 -0800
Message-ID: <CABeXuvpHYTU8qT5_+vxGUfLN34b6n-dF_5=KfRYp4eY22D8CKA@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: Turn off translations at shutdown
To: Lu Baolu <baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org
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

> > +     x86_platform.iommu_shutdown = intel_iommu_shutdown;
>
> How about moving it to detect_intel_iommu() in drivers/iommu/dmar.c? And

Ok, makes sense to move it along with the init handler.

> make sure that it's included with CONFIG_X86_64.

You mean CONFIG_X86 like the init that is already there?

#ifdef CONFIG_X86
    if (!ret)
        x86_init.iommu.iommu_init = intel_iommu_init;
#endif

Thanks,
-Deepa
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
