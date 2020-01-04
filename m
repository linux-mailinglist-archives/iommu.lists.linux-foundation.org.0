Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158F1303AA
	for <lists.iommu@lfdr.de>; Sat,  4 Jan 2020 17:52:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA8F285DEC;
	Sat,  4 Jan 2020 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yz1AR9Yfp31w; Sat,  4 Jan 2020 16:52:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8490885DE6;
	Sat,  4 Jan 2020 16:52:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD73C18DD;
	Sat,  4 Jan 2020 16:52:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02EB7C077D
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jan 2020 16:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0350203BE
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jan 2020 16:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdFpAP65SvsZ for <iommu@lists.linux-foundation.org>;
 Sat,  4 Jan 2020 16:52:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by silver.osuosl.org (Postfix) with ESMTPS id D991C20021
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jan 2020 16:52:33 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l2so46754223lja.6
 for <iommu@lists.linux-foundation.org>; Sat, 04 Jan 2020 08:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9id7c6Kq2uqReKI6594nWZ4Od3JIHPEhhvWaFFHDixk=;
 b=QWyRvydGbnaaQUM3UoX6tGOW4v9Eu3g94s+YwzHvHD5nooM9ozl8Tu197o1VWoavpa
 cFKHYvBKddxY/6zS9TCJED0HmNt1BXfF3iDquu1tzZp8I//O5wX2mTU3PgPF8ywhonB4
 OycsvWcH5VRR+T6dGSP+pmlosnYHJyNPDEGvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9id7c6Kq2uqReKI6594nWZ4Od3JIHPEhhvWaFFHDixk=;
 b=mBm0kxhCU9RR/obGSpMQ8xpjXMMD66cr0Xt9DSrKMmFGO5bHMVdGQMcdoYucQC7oiD
 q1acrHgHy95G9jA5VNc5lAXkI8MC9Be77LTNr9Oh5rcYutABOhRQpSEKxl6XZ2kK2rjs
 MXxbhLeFmoHjoS0uYdRnnP6m+3xbIf6PFqaLUki1FzktqYgz4/0nK6gqcEYznQDldLQT
 xMXFDhEW613jRpVsaYkEEE57Vy7uLGKXfcQjfG1YNUyZLCR2BWMlP0OuoCpno4ZNbQmr
 CCKv2ySQmUJ1+MtJmLWM/IIobcryvGU+vZW5LW3yPnoYYT1ZcPpYsOIPZCEj6yIHlosD
 Vw7A==
X-Gm-Message-State: APjAAAWZmRaFBmd8Cb6FATMpvuNH0xhv0H/PlNZKcKWZ1WhpHpFkOBsB
 FSvJiXlGF0f9sc+zrh5epBgz4fkH9j/tF4gW/iy+sg==
X-Google-Smtp-Source: APXvYqxbVTexv0kIqN2QYltiwgpXvCZlfVhN51NLVG0a5fqog82aN34CGfCA38vE6nQr/HouLOC7d/5WyAbhtW56TcE=
X-Received: by 2002:a2e:868c:: with SMTP id l12mr11625474lji.194.1578156751499; 
 Sat, 04 Jan 2020 08:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <CAL1RGDWU=s6nVArvkci1cXyZVw-fvdtcOjuY+9E+rgBi65q=Aw@mail.gmail.com>
 <567f1506-4a13-535b-ce41-aac079941510@linux.intel.com>
 <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
 <5097d738-352b-92ad-c8ac-0b3e2805aa97@linux.intel.com>
In-Reply-To: <5097d738-352b-92ad-c8ac-0b3e2805aa97@linux.intel.com>
Date: Sat, 4 Jan 2020 08:52:47 -0800
Message-ID: <CAL1RGDXm8LC0OAtOjVrDBCjf=6n6jpgSoHRz1L3y2vj6NhAXMg@mail.gmail.com>
Subject: Re: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Jim Yan <jimyan@baidu.com>, iommu@lists.linux-foundation.org
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
From: Roland Dreier via iommu <iommu@lists.linux-foundation.org>
Reply-To: Roland Dreier <roland@purestorage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> Jim proposed another solution.
>
> https://lkml.org/lkml/2019/12/23/653
>
> Does this work for you?

Yes, that's OK for the cases I've seen too.  All the NTB devices I've
seen are PCI_CLASS_BRIDGE_OTHER with type 0 headers, so this patch
would not break anything.  And I think the idea of allowing DMAR
bridge scope for all devices with PCI class bridge is logical - BIOS
writers probably are going by PCI class rather than header type when
assigning scope.

 - R.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
