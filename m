Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDF158BEB
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 10:33:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A83B586D88;
	Tue, 11 Feb 2020 09:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KI7UWMb5a2-0; Tue, 11 Feb 2020 09:33:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1582C8664E;
	Tue, 11 Feb 2020 09:33:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00323C07FE;
	Tue, 11 Feb 2020 09:33:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 188DCC07FE
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 147E984900
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 09:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KSxN00KRdno for <iommu@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 09:33:14 +0000 (UTC)
X-Greylist: delayed 00:19:16 by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59B0883204
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 09:33:14 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so5426976pgi.1
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CyBYdlNzPZcwqhOp74T1XMugvpFC8qtdcMQo6cEAVoQ=;
 b=aKwwSGpHuYhhyh8Ot2HBH1TVPddBoOM1IgloUFLULdhrSN3NAPSuSZIWQs8eem4tri
 T7JYQJS3SZMMJYLfxkVjJnYpnWq8vNKGUZ7+5ls966HknA1txKwRewAYNTulEG8CUpmG
 GDdDFylpEZsBJcSszVTY6u6KdbmlgXJgUiCXMiofFArq16MvBKq2ZBX8Q8AFPcquEHVI
 zUNFHD65i3sVF7dgjDhGLUq/plddXcLFKeCo+DsO24NhkvixeZaEiZ4rGPNUElJjT5wQ
 oh8lCGjDizwiTjjb850NGgHBA1iHQwHXcj6zuGJpveK3VBScYP+jSgJ1mmBKxin3qI8h
 pQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CyBYdlNzPZcwqhOp74T1XMugvpFC8qtdcMQo6cEAVoQ=;
 b=J77RlrdWhE35g11I2EZINCpxfmBe0j1/v/PLfhjyLFNC+uEuw8a3YW12PrhPiztcC7
 /ynG8KoxZ6RZFssEMVCUMjFwqFpguI4lm3dFDSI5P8/38lo0hx4kGkTaKlfiEpBHcmVx
 zgUwddfDGNvzCaN4Xi65KG6JZMuI8pbBmg9sw6xqj59zBiVyzBgT5WT6oHmsGzA9G7lD
 72VWQIKarwmJP0iWy5A4nO+i9FwpXWgQgkHcQQ608mTcUSg/N3GjNwLJjs1r3W7byylU
 0J8SbzVc/P6qUa575KbvRkqYeQO9drTiA0z7eq0/OXCEms0mmuDOxS0rn2DbuQy9C9Cj
 Obog==
X-Gm-Message-State: APjAAAVGOsUmNDt4Kw7VS0vRC0UgmOaVSF+HeyIGJeu2j7UnPke+S9Zb
 ujSMYJ7MkGIgWzhOrWs40tST9aFapzWOmVvbRcZsaFydRTAa8Q==
X-Google-Smtp-Source: APXvYqzPhqgXg8EP9ZxxdpibAsoCpblQWH+qYglareF2FNtSQYF1Fewu3sUdaISV8w2mebYx/WU9YaLaEHyjLDPiH/o=
X-Received: by 2002:a05:6214:1389:: with SMTP id
 g9mr13997301qvz.40.1581413192840; 
 Tue, 11 Feb 2020 01:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20200203091009.196658-1-jian-hong@endlessm.com>
 <aab0948d-c6a3-baa1-7343-f18c936d662d@linux.intel.com>
 <CAPpJ_edkkWm0DYHB3U8nQPv=z_o-aV4V7RDMuLTXL5N1H6ZYrA@mail.gmail.com>
 <948da337-128f-22ae-7b2e-730b4b8da446@linux.intel.com>
 <CAPpJ_ecM0oCUjYLbG+uTprRk0=OTUBTxZc-d2BGBRDSYWk4uSQ@mail.gmail.com>
 <c8d89c4f-1347-8b9d-0486-a29dd081f26c@linux.intel.com>
 <CAPpJ_ec6H9fqSLA9L8QXir=FBjJqV7xcXp4ea+6XJ8MotDWVyg@mail.gmail.com>
 <b36c252b-943b-3b13-1f25-a8f23e431f39@linux.intel.com>
In-Reply-To: <b36c252b-943b-3b13-1f25-a8f23e431f39@linux.intel.com>
From: Daniel Drake <drake@endlessm.com>
Date: Tue, 11 Feb 2020 17:26:21 +0800
Message-ID: <CAD8Lp45U40ZLb8w22muDKQepXfuhW5hCdyzEtku11Y2X9ab=vQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/intel-iommu: set as DUMMY_DEVICE_DOMAIN_INFO if no
 IOMMU
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Linux Upstreaming Team <linux@endlessm.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jian-Hong Pan <jian-hong@endlessm.com>, David Woodhouse <dwmw2@infradead.org>
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

On Sat, Feb 8, 2020 at 2:30 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
> > The devices under segment 1 are fake devices produced by
> > intel-nvme-remap mentioned here https://lkml.org/lkml/2020/2/5/139
>
> Has this series been accepted?

Sadly not - we didn't find any consensus on the right approach, and
further conversation is hindered by the questionable hardware design
and lack of further communication from Intel in explaining it. It's
one of the exceptional cases where we carry a significant non-upstream
kernel change, because unfortunately most of the current day consumer
PCs we work with have this BIOS option on by default and hence
unmodified Linux can't access the storage devices. On the offchance
that you have some energy to bubble this up inside Intel please let me
know and we will talk more... :)

That said, this thread was indeed only opened since we thought we had
found a more general issue that would potentially affect other cases.
The issue described does seem to highlight a possible imperfection in
code flow, although it may also be reasonable to say that (without
crazy downstream patches at play) if intel_iommu_add_device() fails
then we have bigger problems to face anyway...

> Will this help here? https://www.spinics.net/lists/iommu/msg41300.html

Yes! Very useful info and a real improvement. We'll follow the same
approach here. That does solve the problem we were facing, although we
needed one more fixup which I've sent separately for your
consideration: iommu/vt-d: consider real PCI device when checking if
mapping is needed

Thanks!
Daniel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
