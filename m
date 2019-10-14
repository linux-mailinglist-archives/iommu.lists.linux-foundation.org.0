Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A66D6501
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 16:21:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E3A81501;
	Mon, 14 Oct 2019 14:21:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3B6D145D
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 14:10:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 339F38A9
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 14:10:21 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
	by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1iK139-0001Ft-NS; Mon, 14 Oct 2019 16:10:15 +0200
Date: Mon, 14 Oct 2019 16:10:15 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Subject: Re: Advice on oops - memory trap on non-memory access instruction
	(invalid CR2?)
In-Reply-To: <66eeae28-bfd3-c7a0-011c-801981b74243@canonical.com>
Message-ID: <alpine.DEB.2.21.1910141602270.2531@nanos.tec.linutronix.de>
References: <66eeae28-bfd3-c7a0-011c-801981b74243@canonical.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: halves@canonical.com, mfo@canonical.com, kvm@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux-foundation.org, ioanna-maria.alifieraki@canonical.com,
	jay.vosburgh@canonical.com, gavin.guo@canonical.com
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

On Mon, 14 Oct 2019, Guilherme G. Piccoli wrote:
> Modules linked in: <...>
> CPU: 40 PID: 78274 Comm: qemu-system-x86 Tainted: P W  OE

Tainted: P     - Proprietary module loaded ...

Try again without that module

Tainted: W     - Warning issued before

Are you sure that that warning is harmless and unrelated?

> 4.4.0-45-generic #66~14.04.1-Ubuntu

Does the same problem happen with a not so dead kernel? CR2 handling got
quite some updates/fixes since then.

Thanks,

	tglx


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
