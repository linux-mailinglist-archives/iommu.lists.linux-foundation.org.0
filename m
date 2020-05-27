Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE51E3E1D
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 11:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6254988525;
	Wed, 27 May 2020 09:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvueHUKWPeIl; Wed, 27 May 2020 09:54:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A640D883CB;
	Wed, 27 May 2020 09:54:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B6E1C016F;
	Wed, 27 May 2020 09:54:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62A82C016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 09:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 50CA785E12
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 09:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYUGTdSwRJql for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 09:54:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 471A8862A0
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 09:54:08 +0000 (UTC)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MHG4W-1jr1tl1z5E-00DGkz for <iommu@lists.linux-foundation.org>; Wed, 27
 May 2020 11:54:05 +0200
Received: by mail-qv1-f50.google.com with SMTP id x13so10864975qvr.2
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 02:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM531u7qBXqCVnJ5cL4lg6KbpI0wNUNpI53uMr1dUPcxQCyobpRsbT
 3H0jPYPmE/N82Db1C2iO5foEx8XpiGg9ewqWFQY=
X-Google-Smtp-Source: ABdhPJwFY+9e2QwGxBuOVJhyvZzHkmdup67C33Hon0tX+xYCanXD6siiWNyzzW3vpc4K6tTqx9WsMyOJzXh6HoLxoPA=
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr24222212qvu.197.1590573244279; 
 Wed, 27 May 2020 02:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <1590493749-13823-1-git-send-email-zhangfei.gao@linaro.org>
 <20200527090007.GA179718@kroah.com>
In-Reply-To: <20200527090007.GA179718@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 11:53:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a35fjXt1F2hJygup5gWfjPHZTuU+VD69K5uzrNhhgu0Pw@mail.gmail.com>
Message-ID: <CAK8P3a35fjXt1F2hJygup5gWfjPHZTuU+VD69K5uzrNhhgu0Pw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Introduce PCI_FIXUP_IOMMU
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Provags-ID: V03:K1:QxLc/zCbVCpw8RMWREpXOoIyenLxCpL6rBZc/2F+MDGW/D8TwRb
 CxeJAH+wbSplwPXjpke0QxWxVmgKACedzCtPPT7ednao1qOWYh2d+G7Z41KIAqvl8t+sShv
 I3yrD+ZsuzfHfL69aPSFXMIIabWoQ9CuwkCBcbsqXXIvieT+GXryOXreBzoREyCyOQJu/pM
 okJsCexo8U698gWHEUelA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bN7CDiG+lOk=:KlAzdMJn8PpxmJK4hQOELp
 Lbcut4tRFmHBWEmauCRW1N4vfWkH190uPnfoIi9z62187/agjKMRJDn5sbuKVqrmrSUpmsFcG
 pUYv53nJeIsENhY3E/pSqdBghB5eyoQ0nBS5P9POZ3i9fYBg/x7cgCV7N1XcMUwe8X6Sa8TaA
 +aqrPQ0+Hmm9XQWB7an/QiFcKNwebt4H7/Ld0RxxGTih4n9Q1JC6z1eczoxtnW233NwBOCggo
 0RTv1TXx+ukybiGCsH8KqEZqt3T5y1fzhqFHCpwC1sSo5OxAeNx+qg4caZ0sL2n/hZhnyv51J
 vcPaiyrn9+XTXjjsgLjHYRebwCSiNLXkRPFR5BrMd9Ot8M2PNicS/SUEWPlSmrgu9m7XO8YlT
 xyk7g4mD9TFyHAKdPWc2YNwUv9p9k9uAxD0HGRRRKhYZenZw5E2+U5Nn2O8kAWNPJx3gadoov
 ZRurmXcYo1026gBtPEqjMAzuY/6Q4yyfB9tujWScnzefcQQ+kYzCTGu7y/zlezknvYihJxhIb
 XBcCJlpwmB/3wR0fDmJHl9X94a/tafb1UZhX7bgX3wd3vz2B4g/NhmAX5BWA4e3qTK9uFNcP0
 k5KfkNACwSt6IdVUb8iAHAcjDL6h9g7dgNWodNRt+dvIGxPiVQetzTfJfy4GNNjRU1IWYsdSe
 MeDLlEgYvTTXWKi6DHdweVypinYUQKxIvF4iSA7tGezaueICIrsRqEQCkcmq/7j2VEH4CM225
 Phbgm2052kh6CsILaVlVR5y+44i1Lsvj+8RZuWGlBi8YhM9qyEUA+pDruZJ0pKNGwPKxDBpDU
 9K+6En/161s76XjNOhdFCdLNSvSC6ln2q9sFz8uJR5/330HoCA=
Cc: jean-philippe <jean-philippe@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-pci <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 kenneth-lee-2012@foxmail.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Zhangfei Gao <zhangfei.gao@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
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

On Wed, May 27, 2020 at 11:00 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 26, 2020 at 07:49:07PM +0800, Zhangfei Gao wrote:
> > Some platform devices appear as PCI but are actually on the AMBA bus,
>
> Why would these devices not just show up on the AMBA bus and use all of
> that logic instead of being a PCI device and having to go through odd
> fixes like this?

There is a general move to having hardware be discoverable even with
ARM processors. Having on-chip devices be discoverable using PCI config
space is how x86 SoCs usually do it, and that is generally a good thing
as it means we don't need to describe them in DT

I guess as the hardware designers are still learning about it, this is not
always done correctly. In general, we can also describe PCI devices on
DT and do fixups during the probing there, but I suspect that won't work
as easily using ACPI probing, so the fixup is keyed off the hardware ID,
again as is common for x86 on-chip devices.

      Arnd
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
