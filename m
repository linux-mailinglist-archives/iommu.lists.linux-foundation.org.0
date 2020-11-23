Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7C2C0ED3
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 16:31:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E98AC2039C;
	Mon, 23 Nov 2020 15:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oip5GN5GNTW7; Mon, 23 Nov 2020 15:31:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4A9DC2033E;
	Mon, 23 Nov 2020 15:31:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF15C0052;
	Mon, 23 Nov 2020 15:31:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E53DC0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45A4086695
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fp2OANAN2oSe for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:31:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5FD438669C
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:31:39 +0000 (UTC)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <guilherme.piccoli@canonical.com>) id 1khDoX-0007LX-9M
 for iommu@lists.linux-foundation.org; Mon, 23 Nov 2020 15:31:37 +0000
Received: by mail-ed1-f69.google.com with SMTP id y11so6719943edv.6
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 07:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIYmatONslBJtx0vls11e+ppVgIv/t+HfpL12twmIjk=;
 b=ZopWPLDeFbhLyOFaPGAIgNw8jYSjhAx0jL9G6Ni6PA9FIzUM4rRMKZeJlydaFdVclN
 WSi4zAdrp/fz37TWNqdy0t1JgVPD7FW8PGGtV1/ivxE405WadDrPeBPfc8myJTBDhC8i
 Olpx3muWNe0Sq3sc0uZwzmp2UYTzXKgi7H2itELHLCLH24Gt+cmtgI9v2CGrgE53pyL3
 UQZFfgvPiZTQ1LeVtarIcEQW3pFJvYlv9wvQ3+G+qgRwJu9NRubO+zLtB+UajFhDI2qW
 QFIoHGIHWKqhyDAL4zx/odDoPXI969FFfQer0Gw8JCkD2yDlpoyMn4jgC+aPrDoF9KlK
 JVxA==
X-Gm-Message-State: AOAM532G3JSA87rf1wDVHTmorbshkixkWFbxxGq6vtlh+8naVIwas+M/
 359dLtoB5awgJMLrXKUMK57k80afN3Psn9gAbg16dCh2dfHC3I1zIeryxWu3krPfZcwlx1TPpca
 F1dPka719d5i4yYc8+c7vNndD1Um8BUzu35FfrYTe7DwGG00bTvkxtrQeKI5QG5g=
X-Received: by 2002:aa7:d298:: with SMTP id w24mr5994009edq.82.1606145497008; 
 Mon, 23 Nov 2020 07:31:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrWu7xVwFBmOecqSZY4ld78I3wZkqLcisWUTr1xKJt3H6E/cA0mPHuJlf+nhK7/Ew1KW1Eno+hgp66Z/wsDtc=
X-Received: by 2002:aa7:d298:: with SMTP id w24mr5993991edq.82.1606145496804; 
 Mon, 23 Nov 2020 07:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20201104220804.21026-1-Ashish.Kalra@amd.com>
In-Reply-To: <20201104220804.21026-1-Ashish.Kalra@amd.com>
From: Guilherme Piccoli <gpiccoli@canonical.com>
Date: Mon, 23 Nov 2020 12:31:00 -0300
Message-ID: <CAHD1Q_ycPbd9uuEN2nuT4norwuRt04E5ZdqAVC9si1c-T=SRmA@mail.gmail.com>
Subject: Re: [PATCH v3] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, luto@kernel.org,
 dave.hansen@linux-intel.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, ssg.sos.patches@amd.com,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
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

Hi Ashish, non-technical comment: in the subject, you might want to
s/SWIOTBL/SWIOTLB .
cheers,


Guilherme
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
