Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772217F36
	for <lists.iommu@lfdr.de>; Wed,  8 May 2019 19:42:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F396BED3;
	Wed,  8 May 2019 17:42:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D53B75AA
	for <iommu@lists.linux-foundation.org>;
	Wed,  8 May 2019 17:42:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 820A1875
	for <iommu@lists.linux-foundation.org>;
	Wed,  8 May 2019 17:42:50 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id s3so5483458itk.1
	for <iommu@lists.linux-foundation.org>;
	Wed, 08 May 2019 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2IlGq+6gtguZJVOFjxQj/IggiuNDOuJd20jQKcDFRYM=;
	b=1621xZiZuThZBg+Z5gxWhbzM30zJuZJnRz0KAVksoJXBmEAj7gKSwmpLfcjNOAVm3H
	DXDIYIHREbST5hmzVUyoPeMr/wyFP4LSxO8CGpS07w07QYd5tlrhx4w+e/CsIIC/r3Vn
	SvsXZdTfOr/xunLw0wu4ExfI+txJ1eqchqbX1d1vnKG3zu0R4UhAGyfEGEIYvyNBrJOg
	ageWg274C+HTgTMJuxaCPB6Z/97Th4ARa3M0XTc0sSURjJz1xxeLg6xQRv1uwbt7EKR1
	RJpmcV0ix+FaI0kFiumLXG2Afr3YB1M0A8OgWjbogom1a405F6OJ82rv5f5T61OHXjvM
	G/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2IlGq+6gtguZJVOFjxQj/IggiuNDOuJd20jQKcDFRYM=;
	b=UPapB5bl0FO2tnGltgG61iWet+ZJ8h8jFtLma45NVOj1ah8bEs1FFNCbW+uYndZxpm
	o9PIMIAcRt6WF7l/1B/Xgvz9d0Fi7lL0P6G8Lztr64jNncOiVMVOWI7mTQ9e3blNVyDC
	MYJrVfqsMLD5gGsmMjnnuOZGs46rMUzxZNP98+6OAtAHxye2ErarftNfwH4m3odQtrtn
	AyGO8BOxyPCASdQawQgxstn3+ep569GyeV/SEgVQ2Y9MXw4Dhndw7tCr2sWHSThCkIz1
	LDwixgn/1Bcn/6RjGbeQ8Y1nEDkuZfO3WOlLK1kElkjJMxNrSddDprgZuCU+caWVRqvL
	1AFA==
X-Gm-Message-State: APjAAAWLF2DE9MsDcPPq+1rXDPtaUoFGgVFiiUrrzcpdCFck9XUpVJ3O
	7ut/UG9lKmcUvJw77BOAP4cnTfATActC/pg6KPXWpw==
X-Google-Smtp-Source: APXvYqx+jsMK5tDaxKgEtyXbNr4w3JeLNuYDgOkwRW4V9J4+wBCtBzMFj5BWML3YXmErElHIl3iQasAYVjAPT45fcm4=
X-Received: by 2002:a24:9d0d:: with SMTP id f13mr4941996itd.162.1557337369811; 
	Wed, 08 May 2019 10:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190409140347.GA11524@lst.de>
In-Reply-To: <20190409140347.GA11524@lst.de>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 8 May 2019 18:42:39 +0100
Message-ID: <CAPoiz9wwMCRkzM5FWm18kecC1=kt+5qPNHmQ7eUFhH=3ZNAqYw@mail.gmail.com>
Subject: Re: status of the calgary iommu driver
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Muli Ben-Yehuda <mulix@mulix.org>
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

On Tue, Apr 9, 2019 at 3:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Muli and Jon,
>
> do you know if there are user of systems with the Calgary iommu
> around still? It seems like the last non-drive by changes to it
> are from 2010 and I'm not sure how common these systems were.


These systems were plentiful for 2-4 years after the original series
made it in.  After that, the Intel and AMD IOMMUs should were shipped
and were superior to this chip.  So, even in systems where these might
be present, the AMD/Intel ones should be used (unknown if they were
shipped on the same ones, as both Muli and I have left IBM).

You thinking about removing the code?

Thanks,
Jon
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
