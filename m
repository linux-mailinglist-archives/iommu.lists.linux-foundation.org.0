Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30212E19D
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 03:16:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A10A385725;
	Thu,  2 Jan 2020 02:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71Kop1-Ahpu5; Thu,  2 Jan 2020 02:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF75185BCC;
	Thu,  2 Jan 2020 02:16:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC48DC077D;
	Thu,  2 Jan 2020 02:16:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CEC2C077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 02:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48C6B85566
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 02:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnMAHbDpykal for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 02:16:42 +0000 (UTC)
X-Greylist: delayed 00:05:35 by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4706B84032
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 02:16:42 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m26so36911550ljc.13
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jan 2020 18:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aq5hIkg+CDGgjztOcnTM35a6PCcUWRyfxfnBXkazjkE=;
 b=VPkxDB+YS3UKfLIkzhrhXJbVGnMiVhDE6dZJguqXrtNv7eNsbTHvMjc5DI3LJelm+h
 vCh0Q82w56z3umWHDXwS/VYa/APYauwZ3Jyf1vbS3mcTyB1sjssICAPTGqeL7rapTsjT
 jXUpH2qKYWyRUQz4sa1Vp2juuCs1yXc5zCftI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aq5hIkg+CDGgjztOcnTM35a6PCcUWRyfxfnBXkazjkE=;
 b=pKy1q9gaN2aWrzgTqr0aeOH3Q7S3fJx18txsNwZoT8VPEBw/UETWlH+7S6Akusc7mR
 jWCKZ9x6aVztOjTLaQ9cBCQL0ZebTVlja533h8GF6QFH2Aei4c711rD2AVE2sM47B46l
 prMdno6brT2SP8BAslC4Dn3DmDT3x+DPI9vPCFMVJcdqmnc4BhqNfkP167kU3z1uRQRk
 VHNy0ZMOwpaEAmbaNJ6o2VbX080OLS3psX3TxpKJ4VpmlrnHTTZ6taxfT4RuSBFUIobx
 yPTR2X9F5OKKX06z4EIVOSAmsLk1aEXHddVK7gPYGxt3jrZpV/5x0xSMYET4U8YA5wP2
 Wj+A==
X-Gm-Message-State: APjAAAW7x/zIw8j26xNOfZU26yXnkvb5hqyy4klsrajg79gqV9koneAo
 UxCoFVncvI3WInMj9zK3Qne/r1Gi6Kkyw8PUUCgEZQ==
X-Google-Smtp-Source: APXvYqysMydhSZ3jJ7JwCQdrefr2tj08EIYGn/t0pZG2nY/pL9eITDYYmHaP+XXeBU03/85MJ8+zeYNdPzcqSjsldd4=
X-Received: by 2002:a2e:809a:: with SMTP id i26mr45794930ljg.108.1577931065638; 
 Wed, 01 Jan 2020 18:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
In-Reply-To: <20200102001823.21976-23-baolu.lu@linux.intel.com>
Date: Wed, 1 Jan 2020 18:11:21 -0800
Message-ID: <CAL1RGDWU=s6nVArvkci1cXyZVw-fvdtcOjuY+9E+rgBi65q=Aw@mail.gmail.com>
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

> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2f0d,  /* NTB devices  */
> +                        quirk_dmar_scope_mismatch);
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2020,  /* NVME host */
> +                        quirk_dmar_scope_mismatch);

what's the motivation for changing the logic into a quirk table, which
has to be maintained with new device IDs?

In particular this has the Haswell NTB ID 2F0Dh but already leaves out
the Broadwell ID 6F0Dh.

 - R.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
