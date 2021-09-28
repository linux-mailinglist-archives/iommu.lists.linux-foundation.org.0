Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38A41B237
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 16:38:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB82781A4E;
	Tue, 28 Sep 2021 14:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09ArsoJD7e1e; Tue, 28 Sep 2021 14:38:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 041C581A3B;
	Tue, 28 Sep 2021 14:38:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D32E0C000D;
	Tue, 28 Sep 2021 14:38:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB6E6C000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D277C401CA
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 14:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8Zcv9uhUwfV for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 14:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3EEF400C5
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 14:38:11 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s24so27625581oij.8
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGm4HTeA31BZubMpoPdBi1gqAR87KKhwYyhwPLV50Xc=;
 b=pK4/7krjjquE59EU+0TI247YRWaA6knQJNe4F7rLad94asfYDS9Uoz2tbX98GYhPvK
 4qH6PzdbEwaexcsUPjwLGHFkfUivnlagajA0L3jaXcyGHOVmUkdCt/OMDS8/pVfvjUEq
 qIOFT86riEF0gVSfOfwHqrl71KaW9U4x3XYSF90IdCWiEWbR5Qga4P3T6wpLXCGeGSpT
 gEZO1o/2pvFqmBwbUfoiiKe8QYTYaFB0B8LMwrMQYNl7caAJ0ot2IGU16QGu6EUdiqar
 iDSzMgl7BDZ864Tl0LnOVNFZbOhxe83+7tuSJRyF3/x1ght5n6tgcx5SKmS7a1CEm5hd
 KV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGm4HTeA31BZubMpoPdBi1gqAR87KKhwYyhwPLV50Xc=;
 b=cC7ITvMp82MCk4zndDPTq9slBn+A00wNBzjwNe1FSpZ8KoJLW0VxWlGec8cvV02I5P
 +bqdQP4QEXzKFAy+9/87uWkcuJt6Vzhgu14F1QWCcD3OWGtj8OB63ayL/VH/SMi0ZPhk
 ZfTJuEjgXhg7QIXJkZPAXK8zJVFViO4pLO1NXg9zmO7na5XODjLtPVq5Ex3neyYaJFWA
 ecTvWeuCBUZsS9Vm9vBdAKttxUlSnNdg9SoVwk8w0KvJi1ZE8TQC5QUJzaktTCPCDYWc
 ZZm1AnU1xFyftKlQkDf/T66mRV/psLIkHUbPhoYD+8e2BhOaHVLUD31DG6Sp3pKZABND
 vXoQ==
X-Gm-Message-State: AOAM532f8BZQncw3FcpaZ+la0vT56LMqdkM4DM2y8zfm2aKz75CVqsI+
 jtY+r+a3+Ow8wbonE4W1Srpdl3dU/L/H3q085QIQQA==
X-Google-Smtp-Source: ABdhPJzUc6fntGAtZikZSDIg6zrObw8kPGmDK5a9dwNK3dpklk7JeTD6NbitO+0iq0qRTr+Yc8Y0xKIRlG1DBZB16kY=
X-Received: by 2002:a05:6808:14d3:: with SMTP id
 f19mr3842224oiw.34.1632839890941; 
 Tue, 28 Sep 2021 07:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-3-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-3-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 07:37:58 -0700
Message-ID: <CAPcyv4gyLKpOh4Scbbq8O8_5HByAymigrybek4F_3_+=3cQ9LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] cxl/pci: Remove dev_dbg for unknown register blocks
To: Ben Widawsky <ben.widawsky@intel.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-cxl@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
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

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> While interesting to driver developers, the dev_dbg message doesn't do
> much except clutter up logs. This information should be attainable
> through sysfs, and someday lspci like utilities. This change
> additionally helps reduce the LOC in a subsequent patch to refactor some
> of cxl_pci register mapping.

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
